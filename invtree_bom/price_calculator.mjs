#!/bin/node
import { exit } from 'node:process';
import fs from 'node:fs';

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

const results = [];

if (!process.argv.slice(2)[0]) {
  console.log('falta el csv con el bom de inventree pelotudo');
  exit(1);
}

const bomFile = fs
  .readFileSync(process.argv.slice(2)[0] /* './uEFI_rev3.csv' */, 'utf8')
  .split('\n');

const calculatePriceFromBom = async () => {

  for (let index = 1; index < bomFile.length; index++) {
    const bomLine = bomFile[index];
    if (!bomLine.length) {
      continue;
    }

    const [IPN, IPNQuantity] = bomLine
      .split(',')
      .map((e) => e.split('"').join(''));
    console.log(IPN, ' ; ', IPNQuantity);
    /*  console.log(bomFile); */
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
/*       console.log("----------------------");
      console.log(manufacturerData.SKU);
      console.log("----------------------"); */
      priceBreaks = await getLCSCPriceBreaks({
        bom_item: manufacturerData.SKU,
      });
    }

    const partPricing = await getTotalPriceForPart({
      bom_item: partData,
      quantity: IPNQuantity,
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
    });
  }

  console.table(results, [
    'IPN',
    'unitPrice',
    'supplierStock',
    'totalPrice',
    'supplier',
  ]);
};

calculatePriceFromBom();
