#!/usr/bin/env ruby
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
# based on https://yukimotopress.github.io/http

require 'net/http'
require 'uri'

# set to api.eu.sparkpost.com for EU accounts
url = 'https://api.sparkpost.com/api/v1/recipient-validation/single/'

apiKey = ENV['SPARKPOST_API_KEY'] # API key from environment variable. Should have Recipient Validation rights

recipient = 'test@gmail.com'

uri = URI.parse(url + recipient)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true # need to explicitly set this
req = Net::HTTP::Get.new(uri.request_uri)
req['Authorization'] = apiKey
req['Accept'] = 'application/json'
response = http.request(req)
puts response.code
puts response.body