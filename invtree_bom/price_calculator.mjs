#!/bin/node

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

const calculatePriceFromBom = async () => {
  const mockComponents = [
    { IPN: 'CAP-000216-00', qnt: 45 },
    { IPN: 'CON-000011-00', qnt: 1 },
  ];

  for (let index = 0; index < mockComponents.length; index++) {
    const { IPN, qnt: IPNQuantity } = mockComponents[index];
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
    return;
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
