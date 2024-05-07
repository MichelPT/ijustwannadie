'use strict';
const express = require('express');
const crRoute = express.Router();
const connection = require('../db');

crRoute.get('/read', function (req, res, next) {
    connection.execute('SELECT * FROM persons;')
        .then((result) => {
            var rawData = result[0];
            res.send(JSON.stringify(rawData));
        }).catch((err) => {
            console.log(err);
            res.end();
        });
});

crRoute.post('/write', function (req, res, next) {
    console.log(req)
    connection.execute(`INSERT INTO persons (name, surName) VALUES (?, ?);`,
        [req.body.name, req.body.surName])
        .then(() => {
            console.log('ok');
        }).catch((err) => {
            console.log(err);
        });
    res.end();
});
crRoute.post('/check', function (req, res, next) {
    connection.execute('SELECT * FROM persons WHERE name=? AND surName=?;',
    [req.body.name, req.body.surName])
        .then((result) => {
            var data = result[0];
            if (data.length !== 0) {
                res.status(200).json({
                    status: "Success",
                    message: 'Success mendapatkan user',
                    data: data[0]
                  })
            } else {
                res.status(400).json({
                    status: "Error",
                    message: 'Gadapet user',
                    data: data[0]
                  })
            }
        }).catch((err) => {
            console.log(err);
            res.sendStatus(404);
        });
});

crRoute.use('/', function (req, res, next) {
    res.sendStatus(404);
})
module.exports = crRoute;