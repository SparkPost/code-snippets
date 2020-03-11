#!/usr/bin/env bash
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/

# set to api.eu.sparkpost.com for EU accounts
url='https://api.sparkpost.com/api/v1/recipient-validation/single/'
# API key from environment variable. Should have Recipient Validation rights

recipient="test@gmail.com"

curl $url$recipient -H "Authorization: $SPARKPOST_API_KEY" -H "Content-Type: application/json"
printf "\n"