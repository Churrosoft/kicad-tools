#!/bin/node
import {
  getPartInfoFromIPN,
  getPartManufacterInfo,
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
    console.log('----------------------------------');
    console.log(partPricing);
    results.push({ ...partPricing, supplierStock: priceBreaks.stock , supplier: manufacturerData.supplier_detail.name});
    console.log('----------------------------------');
  }

  console.table(results, ['IPN', 'unitPrice', 'supplierStock', 'totalPrice', 'supplier']);
};

calculatePriceFromBom();
