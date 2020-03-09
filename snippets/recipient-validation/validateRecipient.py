#!/usr/bin/env python3
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
import os, requests

# set to api.eu.sparkpost.com for EU accounts
url = 'https://api.sparkpost.com/api/v1/recipient-validation/single/'
apiKey = os.getenv('SPARKPOST_API_KEY') # API key from environment variable. Should have Recipient Validation rights

recipient = 'test@gmail.com'

h = {'Authorization': apiKey, 'Accept': 'application/json'}
response = requests.get(url + recipient, headers=h)
if response.status_code == 200:
    res = response.json()
    print(res)
else:
    print(response.status_code, response.text)