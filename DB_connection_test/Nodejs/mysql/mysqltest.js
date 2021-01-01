const mysql = require('mysql');

/*
for (let i = 0; i < process.argv.length; i++) {
  console.log(i + ' -> ' + (process.argv[i]));
}
*/

const host = process.argv[2];
const user = process.argv[3];
const password = process.argv[4];
const database = process.argv[5];
const port = process.argv[6];

var config =
{
    host: host,
    user: user,
    password: password,
    database: database,
    port: port,
    ssl: true
};

const conn = new mysql.createConnection(config);

conn.connect(
    function (err) {
    if (err) {
        console.log("!!! Cannot connect !!! Error:");
        throw err;
    }
    else
    {
       console.log("Connection established.");
       conn.query("show databases", function (err, result, fields) {
               if (err) throw err;
               console.log(result);
       });

       conn.end(function (err) {
        if (err) throw err;
        else  console.log('Done.')
       });
    }
  });
