#!/bin/node
/**
 * a guardar en el csv
 * part_ipn
 * quantity
 * optional
 * consumable
 * reference
 * note (con N° parte orishinal de kicad)
 */
import {
  getComponentFootprint,
  getComponentName,
  makeParams,
  getInvtreeCategory,
} from './kicad.mjs';
import { httpRequest, Select, Question /*  ,rl */ } from './select.mjs';
import fs from 'node:fs';
import ReadLine from 'node:readline';

const bomFile = fs
  .readFileSync(process.argv.slice(2)[0] /* './uEFI_rev3.csv' */, 'utf8')
  .split('\n');

const outputBom = fs.createWriteStream('./invtree_output.csv', { flags: 'w' });

outputBom.write('part_ipn,quantity,optional,consumable,reference,note\n');

(async () => {
  for (let index = 1; index < bomFile.length; index++) {
    const bomLine = bomFile[index];
    if (!bomLine.length) {
      continue;
    }
    const splitedLine = bomLine.split(';').map((e) => e.split('"').join(''));

    // Symbol skip:
    if (
      splitedLine[2].startsWith('SYM') ||
      splitedLine[1].startsWith('SYM') ||
      splitedLine[4].startsWith('SYM')
    ) {
      continue;
    }

    const componentName =
      /* getComponentName(splitedLine[2]) ?? */ getComponentName(
        splitedLine[1]
      );
    const component = {
      package: getComponentFootprint(splitedLine[2]) ?? splitedLine[2],
      count: Number(splitedLine[3]),
      name: componentName,
      value: splitedLine[4],
      category: getInvtreeCategory(componentName),
      references: splitedLine[1].split(',').join(';')
    };
    let outputString = '';
    const searchResult = await httpRequest(makeParams(component));
    console.clear();
    console.log('|---------------------------------------------|');
    console.log(
      '| Search for: ',
      component.name,
      ' | ',
      component.package,
      ' | ',
      component.value
    );

    if (searchResult?.results.length) {
      console.log(
        '|   Stock |-- InvTree Part --- | Description ------------ |'
      );
      const options = searchResult.results.map(
        (r) => `| ${r.in_stock}   | ${r.IPN}  | ${r.description}`
      );
      const userResponse = await Select(options);
      const selectedComponent = searchResult.results[userResponse.index];

      outputString = `${selectedComponent.IPN},${component.count},false,true,${component.references},${splitedLine[2]};${splitedLine[3]};${splitedLine[4]}`;
    } else {
      const rl = ReadLine.createInterface({
        input: process.stdin,
        output: process.stdout,
      });

      const user_IPN = await Question(rl)('| no results, enter InvTree IPN:  ');
      rl.close();
      outputString = `${user_IPN},${component.count},false,true,${component.references},${splitedLine[2]};${splitedLine[3]};${splitedLine[4]}`;
    }
    outputBom.write(outputString + '\n');
  }
})();
