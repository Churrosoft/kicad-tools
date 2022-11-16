const CSRF_TOKEN =
  'grzGKVeg3Mo6SjpAk1atuilEMgWMxJH80l9u1IVvmf2DxOQ44bKNo8f1msIer9uG';
const SESSIONID = 'kt5uba5i5shurcrdpfcnubaixw0etbvc';

export const INVTREE_API_URL =
  '/api/part/?search={{search}}&offset=0&limit=25&cascade=1&category={{category}}&category_detail=true';

const KiCADFootprintMappings = {
  [/(R|L|C)_0603/]: '0603',
  [/(R|L|C)_0805/]: '0805',
  [/(R|L|C)_1206/]: '1206',
  [/.*SMD_3225.*/]: 'SMD_3225',
  D_SMA: 'SMA',
  'D_SOD-323': 'SOD-323',
  'D_SOD-523': 'SOD-523',
  'SOT-23-5': 'SOT-23-5',
  'SOT-23': 'SOT-23',
  Fuse_0805_2012Metric: '0805',
  'TO-220': 'TO-220',
  'TO-263': 'TO-263',
  'MSOP-12': 'MSOP-12',
  'LQFP-100': 'LQFP-100',
  SOP65P1030X245: '32-SOIC',
  //Why maxin, why:
  'SOP63P602X175-16N': '16-QSOP',
};

const KiCADComponentMappings = {
  R: 'Resistor',
  C: 'Capacitor',
  D: 'Diode',
  Q: 'Transistor/FET',
  U: 'IC',
  F: 'Fuse',
};

export const getComponentFootprint = (componentFootprint) => {
  const result = Object.keys(KiCADFootprintMappings).map((footprintRegex) => {
    const _rgx = new RegExp(footprintRegex.split('/').join(''));
    if (componentFootprint.search(_rgx) > -1) {
      return KiCADFootprintMappings[footprintRegex];
    }
  });

  return result.filter((x) => x)?.pop();
};

export const getComponentName = (componentFootprint) => {
  const result = Object.keys(KiCADComponentMappings).map((footprintRegex) => {
    if (componentFootprint.search(footprintRegex) > -1) {
      return KiCADComponentMappings[footprintRegex];
    }
  });

  return result.filter((x) => x)?.pop();
};

export const getInvtreeCategory = (componentName) => {
  switch (componentName) {
    case 'Fuse':
      return 10;
    case 'Capacitor':
      return 4;
    case 'Resistor':
      return 59;
    case 'Transistor/FET':
      return 65;
    default:
      return null;
  }
};

export const makeParams = (component) => ({
  host: 'stock.lan',
  port: 80,
  method: 'GET',
  timeout: 1000,
  path: INVTREE_API_URL.replace(
    '{{search}}',
    encodeURI(`${component.package} ${component.value}`)
  ).replace('{{category}}', component.category ?? null),
  headers: {
    Cookie: `csrftoken=${CSRF_TOKEN}; sessionid=${SESSIONID}`,
    'X-CSRFToken': CSRF_TOKEN,
  },
});
