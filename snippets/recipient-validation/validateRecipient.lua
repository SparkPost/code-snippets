#!/usr/bin/env lua
-- API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
-- local http = require "socket.http"
local https = require("ssl.https")
local ltn12 = require("ltn12")

-- set to api.eu.sparkpost.com for EU accounts
local url = "https://api.sparkpost.com/api/v1/recipient-validation/single/"

local apiKey = os.getenv("SPARKPOST_API_KEY") -- API key from environment variable. Should have Recipient Validation rights

local recipient = 'test@gmail.com'

local h = {
  Authorization = apiKey,
  Accept = "application/json",
 }

local t = {} -- need a "table sink" to receive result - see https://stackoverflow.com/questions/15453058/lua-socket-http-sink-parameter

local r, c, h2, s = https.request {
  url = url .. recipient,
  method = "GET",
  headers = h,
  protocol = "tlsv1_2", -- choose deliberately
  sink = ltn12.sink.table(t)
}

print(s)
print(table.concat(t))
