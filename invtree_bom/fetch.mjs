import http from 'node:http';

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

export const makeGetParams = (host,path) => ({
  host: host,
  port: 80,
  method: 'GET',
  timeout: 1000,
  path,
});

export default httpRequest;
