#!/usr/bin/env node
"use strict";

//set to api.eu.sparkpost.com for EU accounts
const url = 'https://api.sparkpost.com/api/v1/recipient-validation/single/';
const apiKey = process.env.SPARKPOST_API_KEY; // API key from environment variable. Should have Recipient Validation rights

const recipient = 'test@gmail.com';

// removed old request library example

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