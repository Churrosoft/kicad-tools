import https from 'node:https';

// ARG
export const dolarRateAPI = 'https://criptoya.com/api/dolar';

// LCSC
export const LCSCShippingRateAPI =
  'https://wwwapi.lcsc.com/v1/orders/shipments/getExpresses?country=AR&post_code=1050&state=CABA&weight={{weight}}&products_total={{products_total}}&city=&items_total=1&from=cart';

export const LCSCComponentSearch = (productID) => ({
  method: 'get',
  url: 'https://wwwapi.lcsc.com/v1/products/detail?product_code={{productID}}'.replace(
    '{{productID}}',
    productID
  ),
  headers: {
    accept: 'application/json, text/plain, */*',
    'accept-language': 'es-ES,es;q=0.9,en;q=0.8',
    'cache-control': 'no-cache',
    pragma: 'no-cache',
    'sec-ch-ua':
      '"Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Linux"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-site',
  },
  httpsAgent: new https.Agent({
    secureProtocol: 'TLSv1_2_method',
  }),
});

// DIGIKEY

export const digikeyGetUserConfig = (referrer) => ({
  url: 'https://www.digikey.com/MyDigiKey/Home/GetCurrentUser',
  headers: {
    accept: '*/*',
    'accept-language': 'es-ES,es;q=0.9',
    'cache-control': 'no-cache',
    pragma: 'no-cache',
    'sec-ch-ua':
      '"Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Linux"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-origin',
  },
  referrer,
  referrerPolicy: 'strict-origin-when-cross-origin',
  body: null,
  method: 'GET',
  mode: 'cors',
  credentials: 'include',
  httpsAgent: new https.Agent({
    secureProtocol: 'TLSv1_2_method',
  }),
});

export const DigiKeyConfig = (productID, referrer, cookie) => ({
  method: 'get',
  url: 'https://www.digikey.com/products/api/v4/pricing/{{productID}}'.replace(
    '{{productID}}',
    productID
  ),
  headers: {
    authority: 'www.digikey.com',
    accept: '*/*',
    'accept-language': 'en-us',
    'cache-control': 'no-cache',
    cookie,
    pragma: 'no-cache',
    referer: referrer,
    /* 'request-id': '|d2c48de908d24686811aa10585b9b9d4.ea2f56893db84714', */
    'sec-ch-ua':
      '"Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Linux"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-origin',
    'user-agent':
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
    'x-currency': 'USD',
    /*     'x-request-id': '4e7c910e-06c1-417a-b4aa-ca7ef1bf9442', */
  },
  httpsAgent: new https.Agent({
    secureProtocol: 'TLSv1_2_method',
  }),
});

// INVENTREE
const CSRF_TOKEN =
  'grzGKVeg3Mo6SjpAk1atuilEMgWMxJH80l9u1IVvmf2DxOQ44bKNo8f1msIer9uG';
const SESSIONID = 'kt5uba5i5shurcrdpfcnubaixw0etbvc';
export const getInvenTreeConfig = (url) => ({
  method: 'get',
  url,
  headers: {
    Cookie: `csrftoken=${CSRF_TOKEN}; sessionid=${SESSIONID}`,
    'X-CSRFToken': CSRF_TOKEN,
  },
});
