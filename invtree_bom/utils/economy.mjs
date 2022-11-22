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
  // por ahora 1.5x a todo, luego cuando consiga una factura de DHL hago todo por item

  return bom_items.reduce((prev, current) => {});

  return 0;
};

// ---------------- LCSC -------------------

export const getLCSCShippingRates = async ({ weight, products_total }) => {
  // a todo esto faltaria los costos de importacion:

  const shippingResult = await axios
    .get(
      LCSCShippingRateAPI.replace('{{weight}}', weight).replace(
        '{{products_total}}',
        products_total
      )
    )
    .catch((e) => console.log(e));

  return shippingResult.data.expresses_data;
};

export const getLCSCPriceBreaks = async ({ bom_item }) => {
  const data = await axios(LCSCComponentSearch(bom_item)).catch((e) =>
    console.log(e)
  );

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
  const data = await axios(digikeyGetUserConfig(bom_url)).catch((e) =>
    console.log(e)
  );
  const cookies = data.headers['set-cookie'];

  const getPartResult = await axios(
    DigiKeyConfig(bom_item, bom_url, cookies)
  ).catch((e) => console.log(e));

  const formatNumber = (n) =>
    n ? Number(n.replace('$', '').split(',').join('')) : 0;

  const stockInfo = {
    stock: formatNumber(getPartResult.data.data.priceQuantity.qtyAvailable),
    pricing: getPartResult.data.data.priceQuantity.pricing[0].pricingTiers.map(
      (part) => {
        const breakQty = formatNumber(part.breakQty);
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
  for (
    let price_index = 0;
    price_index < price_breaks.pricing.length;
    price_index++
  ) {
    const price = price_breaks.pricing[price_index];
    if (price.breakQty > quantity) {
      return {
        ...bom_item,
        unitPrice: Number(price.unitPrice.toFixed(3)),
        totalPrice: Number((price.unitPrice * quantity).toFixed(3)),
      };
    }
  }
  return {
    ...bom_item,
    unitPrice: Number(price_breaks.pricing[0].unitPrice.toFixed(3)),
    totalPrice: Number(
      (price_breaks.pricing[0].unitPrice * quantity).toFixed(3)
    ),
  };
};
