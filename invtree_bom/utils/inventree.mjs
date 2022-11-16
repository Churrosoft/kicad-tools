import axios from 'axios';
import { getInvenTreeConfig } from './config.mjs';

export const getPartInfoFromIPN = async (IPN) => {
  const response = await axios(
    getInvenTreeConfig(
      'http://stock.lan/api/part/?IPN={{IPN}}'.replace('{{IPN}}', IPN)
    )
  );
  if (response?.data?.length) {
    return response.data.pop();
  }
};

export const getPartManufacterInfo = async (PK) => {
  const response = await axios(
    getInvenTreeConfig(
      'http://stock.lan/api/company/part/.*?part={{PK}}'.replace('{{PK}}', PK)
    )
  );
  if (response?.data?.length) {
    return response.data.pop();
  }
};
