import http, { makeGetParams } from './fetch.mjs';
import fetch from 'node-fetch';

let pricing_cache = {
  oficial: null,
  real: null,
};

const dolarRateAPI = { host: 'https://criptoya.com', path: '/api/dolar' };
const shippingRateAPI =
  'https://wwwapi.lcsc.com/v1/orders/shipments/getExpresses?country=AR&post_code=1050&state=CABA&weight={{weight}}&products_total={{products_total}}&city=&items_total=1&from=cart';

export const getDolarRate = async () => {
  if (!pricing_cache.oficial) {
    const rateResult = await http(
      makeGetParams(dolarRateAPI.host, dolarRateAPI.path)
    );
    pricing_cache.oficial = rateResult.oficial;
    pricing_cache.real = rateResult.mep;
  }
  return pricing_cache;
};

export const getShippingRates = async ({ weight, products_total }) => {
  // a todo esto faltaria los costos de importacion:
  console.log();

  const shippingResult = await fetch(
    shippingRateAPI
      .replace('{{weight}}', weight)
      .replace('{{products_total}}', products_total)
  );

  console.log(await shippingResult.json());
  return shippingResult;
};
