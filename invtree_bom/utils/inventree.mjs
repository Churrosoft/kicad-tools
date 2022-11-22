import axios from 'axios';
import { getInvenTreeConfig } from './config.mjs';

export const getPartInfoFromIPN = async (IPN) => {
  const response = await axios(
    getInvenTreeConfig('/part/?IPN={{IPN}}'.replace('{{IPN}}', IPN))
  ).catch((e) => console.log(e));
  if (response?.data?.length) {
    return response.data.pop();
  }
};

export const getPartManufacterInfo = async (PK) => {
  const response = await axios(
    getInvenTreeConfig('/company/part/.*?part={{PK}}'.replace('{{PK}}', PK))
  ).catch((e) => console.log(e));
  if (response?.data?.length) {
    return response.data.pop();
  }
};

export const updatePriceBreaks = async ({
  IPN,
  price_breaks,
  verbose = false,
}) => {
  try {
    const formatedPriceBreaks = price_breaks.map((price) => ({
      part: IPN,
      quantity: price.breakQty,
      price: price.unitPrice,
      price_currency: 'USD',
    }));

    if (verbose) {
      console.log(formatedPriceBreaks);
    }

    // search for older price breaks:
    // /api/company/price-break/.*?part=221
    const searchResult = await axios(
      getInvenTreeConfig(
        '/company/price-break/.*?part={{IPN}}'.replace('{{IPN}}', IPN)
      )
    );

    if (searchResult?.data?.length) {
      for (let index = 0; index < searchResult?.data.length; index++) {
        const priceBreak = searchResult?.data[index];
        await axios(
          getInvenTreeConfig('/company/price-break/' + priceBreak.pk, 'delete')
        );
      }
    }

    for (let index = 0; index < formatedPriceBreaks.length; index++) {
      const priceBreak = formatedPriceBreaks[index];
      const response = await axios(
        getInvenTreeConfig('/company/price-break/.*', 'post', priceBreak)
      );
      /*   console.log(response.data); */
    }
  } catch (error) {
    console.log('la palmo invtree al updatear los pricebreaks');
    if (verbose) {
      console.log(error?.data);
      console.log(error);
    }
  }
};

export const parseBoomOutput = (filename) => {
  // TODO: garrar la pala
};
