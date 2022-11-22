#!/bin/node
import { exit } from 'node:process';

import * as dotenv from 'dotenv';
dotenv.config();

import {
  getPartInfoFromIPN,
  getPartManufacterInfo,
  updatePriceBreaks,
} from './utils/inventree.mjs';

import {
  getDigiKeyPriceBreaks,
  getLCSCPriceBreaks,
  getTotalPriceForPart,
} from './utils/economy.mjs';

if (!process.argv.slice(2)[0]) {
  console.log('falta el IPN de InvenTree');
  exit(1);
}
const results = [];

const IPN = process.argv.slice(2)[0];

const updatePriceBreakFromIPN = async () => {
  const partData = await getPartInfoFromIPN(IPN);
  const manufacturerData = await getPartManufacterInfo(partData.pk);

  let priceBreaks;

  manufacturerData.pk; // ID para agregar pricebreaks;
  manufacturerData.supplier; // ID de supplier (lcsc/digi/etc)

  if (manufacturerData.supplier === 1) {
    const digikeyURL = manufacturerData.link;
    const digikeyPartNumber = manufacturerData.link.split('/').pop();

    priceBreaks = await getDigiKeyPriceBreaks({
      bom_item: digikeyPartNumber,
      bom_url: digikeyURL,
    });
  } else {
    priceBreaks = await getLCSCPriceBreaks({
      bom_item: manufacturerData.SKU,
    });
  }

  const partPricing = await getTotalPriceForPart({
    bom_item: partData,
    quantity: 1,
    price_breaks: priceBreaks,
  });

  results.push({
    ...partPricing,
    supplierStock: priceBreaks.stock,
    supplier: manufacturerData.supplier_detail.name,
  });
  await updatePriceBreaks({
    IPN: manufacturerData.pk,
    price_breaks: priceBreaks.pricing,
    verbose:true,
  });

  console.table(results, [
    'IPN',
    'unitPrice',
    'supplierStock',
    'totalPrice',
    'supplier',
  ]);
};

updatePriceBreakFromIPN();