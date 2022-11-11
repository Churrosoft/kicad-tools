import * as readline from 'node:readline';
import http from 'node:http';
import { exit } from 'node:process';
import util from 'util';

const input = process.stdin;
const output = process.stdout;

const getPadding = (num = 10) => {
  let text = ' ';
  for (let i = 0; i < num.length; i++) {
    text += ' ';
  }
  return text;
};

export const Select = (selectOption) =>
  new Promise((resolve, reject) => {
    let isFirstTimeShowMenu = true;
    const selector = '>';
    let selectIndex = 0;

    const keyPressedHandler = (_, key) => {
      if (key) {
        const optionLength = selectOption.length - 1;
        if (key.name === 'down' && selectIndex < optionLength) {
          selectIndex += 1;
          createOptionMenu();
        } else if (key.name === 'up' && selectIndex > 0) {
          selectIndex -= 1;
          createOptionMenu();
        } else if (key.name === 'return') {
          input.setRawMode(false);
          console.clear();
          input.removeAllListeners('keypress');
          resolve({ val: selectOption[selectIndex], index: selectIndex });
        } else if (key.name === 'escape' || (key.name === 'c' && key.ctrl)) {
          input.removeAllListeners('keypress');
          console.clear();
          exit();
        }
      }
    };

    const ansiEraseLines = (count) => {
      //adapted from sindresorhus ansi-escape module
      const ESC = '\u001B[';
      const eraseLine = ESC + '2K';
      const cursorUp = (count = 1) => ESC + count + 'A';
      const cursorLeft = ESC + 'G';

      let clear = '';

      for (let i = 0; i < count; i++) {
        clear += eraseLine + (i < count - 1 ? cursorUp() : '');
      }

      if (count) {
        clear += cursorLeft;
      }

      return clear;
    };

    const ansiColors = (text, color) => {
      const colors = {
        green: 32,
        blue: 34,
        yellow: 33,
      };
      if (colors[color]) `\x1b[${colors[color]}m${text}\x1b[0m`;
      //default for colors not included
      return `\x1b[32m${text}\x1b[0m`;
    };

    const createOptionMenu = () => {
      const optionLength = selectOption.length;
      if (isFirstTimeShowMenu) {
        isFirstTimeShowMenu = false;
      } else {
        output.write(ansiEraseLines(optionLength));
      }
      const padding = getPadding(20);
      const cursorColor = ansiColors(selector, 'green');

      for (let i = 0; i < optionLength; i++) {
        const selectedOption =
          i === selectIndex
            ? `- ${cursorColor} ${selectOption[i]}`
            : `- ${getPadding(40)} ${selectOption[i]}`;
        const ending = i !== optionLength - 1 ? '\n' : '';
        output.write(padding + selectedOption + ending);
      }
    };

    readline.emitKeypressEvents(input);
    input.setRawMode(true);
    input.resume();
    input.on('keypress', keyPressedHandler);

    if (selectIndex >= 0) {
      createOptionMenu();
    }
  });

export function httpRequest(t, n) {
  return new Promise(function (e, o) {
    var u = http.request(t, function (t) {
      if (t.statusCode < 200 || t.statusCode >= 300)
        return o(Error('statusCode=' + t.statusCode));
      var n = [];
      t.on('data', function (t) {
        n.push(t);
      }),
        t.on('end', function () {
          try {
            n = JSON.parse(Buffer.concat(n).toString());
          } catch (t) {
            o(t);
          }
          e(n);
        });
    });
    u.on('error', function (t) {
      o(t);
    }),
      n && u.write(n),
      u.end();
  });
}

/* export const rl = ReadLine.createInterface({
  input: process.stdin,
  output: process.stdout,
});
 */
export const Question = (rl) => util.promisify(rl.question).bind(rl);

/*  const userInput = (Question) =>
  new Promise((resolve, reject) => {
    rl.question(Question, function (Answer) {
      rl.close();
      resolve(Answer);
    });
  }); */

/* (async () => {
  console.log(await Select(['mango', 'banana', 'apple', 'orange']));
  console.log(await Select(['mango 2', 'banana 3', 'apple', 'orange']));
  exit();
})();
 */
