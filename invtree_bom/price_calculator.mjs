#!/bin/node

import { getLCSCShippingRates } from './utils/economy.mjs';

getLCSCShippingRates({ weight: 345, products_total: 600.2 });

/**
 * sacar supplier info:
 * buscar parte por IPN => conseguir ID
 * api/company/part/{ID}/
 *
 */

const supplierMock = {
  available: '0.000',
  availability_updated: null,
  description: 'CONN HEADER BRD EDGE 48POS',
  link: 'https://www.digikey.com/en/products/detail/molex/0366380002/2421509',
  manufacturer_detail: {
    pk: 9,
    url: '/company/9/',
    name: 'Molex',
    description: 'Molex',
    image: '/static/img/blank_image.thumbnail.png',
  },
  manufacturer_part: 11,
  manufacturer_part_detail: {
    pk: 11,
    part: 11,
    part_detail: {
      pk: 11,
      IPN: 'CON-000011-00',
      default_location: null,
      name: '0366380002',
      revision: 'A',
      full_name: 'CON-000011-00 | 0366380002 | A',
      description: 'CONN HEADER BRD EDGE 48POS',
      thumbnail: '/media/part_images/11_thumbnail.thumbnail.jpeg',
      active: true,
      assembly: false,
      is_template: false,
      purchaseable: true,
      salable: false,
      trackable: false,
      virtual: false,
      units: '',
    },
    manufacturer: 9,
    manufacturer_detail: {
      pk: 9,
      url: '/company/9/',
      name: 'Molex',
      description: 'Molex',
      image: '/static/img/blank_image.thumbnail.png',
    },
    description: 'CONN HEADER BRD EDGE 48POS',
    MPN: '0366380002',
    link: 'https://www.molex.com/pdm_docs/sd/366380002_sd.pdf',
  },
  note: null,
  pk: 11,
  packaging: null,
  pack_size: 1.0,
  part: 11,
  part_detail: {
    pk: 11,
    IPN: 'CON-000011-00',
    default_location: null,
    name: '0366380002',
    revision: 'A',
    full_name: 'CON-000011-00 | 0366380002 | A',
    description: 'CONN HEADER BRD EDGE 48POS',
    thumbnail: '/media/part_images/11_thumbnail.thumbnail.jpeg',
    active: true,
    assembly: false,
    is_template: false,
    purchaseable: true,
    salable: false,
    trackable: false,
    virtual: false,
    units: '',
  },
  SKU: 'WM4438-ND',
  supplier: 1,
  supplier_detail: {
    pk: 1,
    url: '/company/1/',
    name: 'Digi-Key',
    description: '',
    image: '/media/company_images/company_1_img.thumbnail.jpg',
  },
  url: '/supplier-part/11/',
};

/* function Person(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
  
  var john = new Person("John", "Smith");
  var jane = new Person("Jane", "Doe");
  var emily = new Person("Emily", "Jones");
  
console.table([john, jane, emily], ["firstName"]);
 */
