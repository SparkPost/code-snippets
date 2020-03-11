#!/usr/bin/env node
"use strict";
const request = require('request');
//set to api.eu.sparkpost.com for EU accounts
const url = 'https://api.sparkpost.com/api/v1/recipient-validation/single/';
const apiKey = process.env.SPARKPOST_API_KEY; // API key from environment variable. Should have Recipient Validation rights

const recipient = 'test@gmail.com';

request.get({
    url: url + recipient,
    headers: {
        'Accept': 'application/json',
        'Authorization': apiKey
    }
}, function (error, response, body) {
    console.log("\nRequest:")
    console.error('error:', error);
    console.log('statusCode:', response && response.statusCode);
    console.log('body:', body);
});

// newer Axios library
const axios = require('axios');
axios({
    method: 'get',
    url: url + recipient,
    headers: {
        'Accept': 'application/json',
        'Authorization': apiKey
    }
})
    .then(function (response) {
        // handle success
        console.log("\nAxios:")
        console.log(response.data);
    })
    .catch(function (error) {
        // handle error
        console.log(error);
    });