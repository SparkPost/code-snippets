#!/usr/bin/ruby

############################################################################
# This is a simple example of encoding a binary file into an email body
# for transmission through SparkPost
############################################################################

require 'base64'
require 'json'
require 'net/http'


##########################
# Customer Configuration
#########################

API_AUTH_KEY='PUT_YOUR_API_KEY_HERE'

TRANSMISSION_URL='https://api.sparkpost.com/api/v1/transmissions'

SUBJECT='[TEST] Subject of Message' 

RECIPIENT='chris.wilson@messagesystems.com'

FROM='chrisw@test.yepher.com'

HTML_CONTENT='Sample email content from JSON'

#####################################
# Make sure user set their API Key
#####################################

if (API_AUTH_KEY == 'PUT_YOUR_API_KEY_HERE') 
    abort("You must set your API Key in 'encode.rb' before an email can be sent.")
end



############################
# Read a template email in
###########################

file = File.open("./SampleVoiceMail.eml", "rb")
email_contents = file.read
# print "Template: %s", email_contents

############################
# Base64 Encode Binary File
############################

encoded_file = Base64.encode64(File.open("./SampleVoiceMail.wav", "rb").read)
#print "Encoded: %s", encoded_file

##############################################################
# replace {{B64_VOICEMAIL_DATA}} with the B64 encoded string
#############################################################

tag = "{{B64_VOICEMAIL_DATA}}"
encoded_email = email_contents.sub(tag, encoded_file)
#print "Output: %s", encoded_email


################################
# Read in the transmission JSON
###############################

file = File.read('./transmission.json')
transmission_json = JSON.parse(file)
#print "Json: %s", transmission_json

transmission_json['substitution_data']['from'] = FROM
transmission_json['recipients'][0]['address']['email'] = RECIPIENT
transmission_json['substitution_data']['subject'] = SUBJECT
transmission_json['substitution_data']['custom_html'] = HTML_CONTENT


###################################################
# Put the encoded email into the transmission json
##################################################

content_json = transmission_json['content']
content_json['email_rfc822'] =  encoded_email
print "Json: ", transmission_json


####################################
# Ppost transmission JSON to server
####################################

uri = URI(TRANSMISSION_URL)
http = Net::HTTP.new(uri.host, uri.port)
req = Net::HTTP::Post.new uri.path
req["Authorization"] = API_AUTH_KEY
req["Content-Type"] = "application/json"
req.body = transmission_json.to_json

res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http.ssl_version = :SSLv3
  http.request req
end


print "\n\nDONE!!!\n\n"





 
