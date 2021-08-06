const express = require('express');
const app = express();
const request = require('request');
const async = require('async');
const exec = require('child_process');
app.get('/test', (request, response) => {
    try {
        if (request.query.profile) {
            myscript = exec.exec('sh exec.sh ' + request.query.profile);
            myscript.stdout.on('data', function (data) {
                console.log(data);
            });
            myscript.stderr.on('data', function (data) {
                console.log(data);
            });
            response.json({ 'task': "test running" });
        }
        else {
            response.send('Debe pasar el profile como parámetro');
        }

    } catch (error) {
        console.log(error)
    }
})

app.listen('8010', () => {
    console.log('Server listening on 8010...');
})

//local
//http://localhost:8010/test?profile=wip_web_ff