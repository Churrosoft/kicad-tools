import axios from 'axios';

import {
  dolarRateAPI,
  LCSCShippingRateAPI,
  digikeyGetUserConfig,
  DigiKeyConfig,
  LCSCComponentSearch,
} from './config.mjs';

let pricing_cache = {
  oficial: null,
  real: null,
};

// ---------------- ARG -------------------

export const getDolarRate = async () => {
  if (!pricing_cache.oficial) {
    const rateResult = await axios.get(dolarRateAPI);
    pricing_cache.oficial = rateResult.oficial;
    pricing_cache.real = rateResult.mep;
  }
  return pricing_cache;
};

export const calculateAduanaFees = async ({ bom_items, shipping_info }) => {
  return 0;
};

// ---------------- LCSC -------------------

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

export const getLCSCPriceBreaks = async ({ bom_item }) => {
  const data = await axios(LCSCComponentSearch(bom_item));

  const pricingInfo = data?.data?.productPriceList?.map((part) => {
    const breakQty = Number(part.ladder);
    const unitPrice = Number(part.usdPrice);
    const extendedPrice = Number(breakQty * unitPrice);

    return {
      breakQty,
      unitPrice,
      extendedPrice,
    };
  });

  return {
    stock: data?.data?.stockNumber,
    pricing: pricingInfo,
  };
};

// ---------------- DIGI -------------------

export const getDigiKeyShippingRates = async ({ weight, products_total }) => {
  return 0;
};

export const getDigiKeyPriceBreaks = async ({ bom_item, bom_url }) => {
  const data = await axios(digikeyGetUserConfig(bom_url));
  const cookies = data.headers['set-cookie'];

  const getPartResult = await axios(DigiKeyConfig(bom_item, bom_url, cookies));

  const formatNumber = (n) => Number(n.replace('$', '').split(',').join(''));

  const stockInfo = {
    stock: formatNumber(getPartResult.data.data.priceQuantity.qtyAvailable),
    pricing: getPartResult.data.data.priceQuantity.pricing[0].pricingTiers.map(
      (part) => {
        const breakQty = Number(part.breakQty);
        const unitPrice = formatNumber(part.unitPrice);
        const extendedPrice = formatNumber(part.extendedPrice);
        return {
          breakQty,
          unitPrice,
          extendedPrice,
        };
      }
    ),
  };
  return stockInfo;
};

// common

export const getTotalPriceForPart = async ({
  bom_item,
  quantity,
  price_breaks,
}) => {
  for (let price_index = 0; price_index < price_breaks.pricing.length; price_index++) {
    const price = price_breaks.pricing[price_index];
    if (price.breakQty > quantity) {
      return {
        ...bom_item,
        unitPrice: price.unitPrice,
        totalPrice: price.unitPrice * quantity,
      };
    }
  }
  return {
    ...bom_item,
    unitPrice: price_breaks.pricing[0].unitPrice,
    totalPrice: price_breaks.pricing[0].unitPrice * quantity,
  };
};


