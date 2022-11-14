import axios from 'axios';

import {
  dolarRateAPI,
  LCSCShippingRateAPI,
  digikeyGetUserConfig,
  DigiKeyConfig,
} from './config.mjs';

let pricing_cache = {
  oficial: null,
  real: null,
};

export const getDolarRate = async () => {
  if (!pricing_cache.oficial) {
    const rateResult = await axios.get(dolarRateAPI);
    pricing_cache.oficial = rateResult.oficial;
    pricing_cache.real = rateResult.mep;
  }
  return pricing_cache;
};

export const getLCSCShippingRates = async ({ weight, products_total }) => {
  // a todo esto faltaria los costos de importacion:

  const shippingResult = await axios.get(
    LCSCShippingRateAPI.replace('{{weight}}', weight).replace(
      '{{products_total}}',
      products_total
    )
  );

  return shippingResult.data.expresses_data;
};

export const getDigiKeyShippingRates = async ({ weight, products_total }) => {
  return 0;
};

export const calculateAduanaFees = async ({ bom_items, shipping_info }) => {
  return 0;
};

export const getDigiKeyPriceBreaks = async ({ bom_item, bom_url }) => {
  const data = await axios(
    digikeyGetUserConfig(
      'https://www.digikey.com/en/products/detail/molex/0366380002/2421509'
    )
  );
  const cookies = data.headers['set-cookie'];

  const getPartResult = await axios(
    DigiKeyConfig(
      '2421509',
      'https://www.digikey.com/en/products/detail/molex/0366380002/2421509',
      cookies
    )
  );

  const stockInfo = {
    stock: getPartResult.data.data.priceQuantity.qtyAvailable,
    pricing: getPartResult.data.data.priceQuantity.pricing[0].pricingTiers,
  };
  console.log(stockInfo);
};
