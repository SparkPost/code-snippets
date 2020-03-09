# Encoding Attachments into Email

This is a simple example of sending a wav file as an attachment in an email.

## Usage

This example is written in Ruby. Users must configure their API_KEY and server before an email can be sent.

* Edit `encode.rb`
	* Set `API_AUTH_KEY` to your SparkPost [API Key](https://app.sparkpost.com/account/credentials)
	* Make sure `TRANSMISSION_URL` is set to your SparkPost environment
	* Set `RECIPIENT` to the recipient that will receive email
	* Set `FROM` to the the from address for the email
	* Save and close file
* Run: `ruby encode.rb`


## How Does it Work

The script loads the file `SampleVoiceMail.wav` and Base64 encodes it. The encoded data is placed into the tag `{{B64_VOICEMAIL_DATA}}` of the file `SampleVoiceMail.eml`.

This encoded email is then encoded in the the SparkPost [Transmission API](https://www.sparkpost.com/api#/reference/transmissions) and sent to the server. 


## Example Files

| Name  | Description  |
|:-:|---|
| encode.rb  | A ruby script that demonstrates how to send an attachment in an email.  |
| README.md  | Usage Information  |
| SampleVoiceMial.eml  | An email template that the attachment will be put into.  |
| SampleVocieMail.wav  | The binary file that will be base64 encoded and put into an email  |
| transmission.json  | A sample transmission JSON object.  |




