/*jslint node:true, nomen:true, sloppy:true, maxlen:80 */
var Http, Fs, server, connect;
Http = require('http');
Fs = require('fs');
connect = require('connect');

server = connect(
    connect['static'](__dirname)
);

Http.createServer(server).listen(8081);
Fs.writeFileSync(__dirname + '/http-pid', process.pid, 'utf-8');
