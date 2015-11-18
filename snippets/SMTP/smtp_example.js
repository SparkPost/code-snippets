// This example utilizes the 'nodemailer' and 'nodemailer-smtp-transport'
// modules which can be installed using the following commands:
// npm install nodemailer
// npm install nodemailer-smtp-transport

// Note: nodemailer users looking to switch to the SparkPost
// REST API may be interested in the SparkPost nodemailer transport:
// https://github.com/SparkPost/nodemailer-sparkpost-transport

var nodemailer = require('nodemailer');
var smtpTransport = require('nodemailer-smtp-transport');

var transporter = nodemailer.createTransport(smtpTransport({
      host: 'smtp.sparkpostmail.com',
      port: 587,
      auth: {
        user: 'SMTP_Injection',

        // You will need an API Key with 'Send via SMTP' permissions.
        // Create one here: https://app.sparkpost.com/account/credentials
        pass: '<YOUR API KEY>'
      }
    }));
 
var mailData = {
  // sparkpostbox.com is a sending domain used for testing
  // purposes and is limited to 50 messages per account.
  // Visit https://app.sparkpost.com/account/sending-domains
  // to register and verify your own sending domain.
  from: 'testing@sparkpostbox.com',

  to: 'recipient@example.com',
  subject: 'Testing SparkPost SMTP from Node.js!',
  text: 'Hello World!'
};
 
transporter.sendMail(mailData, function(error, info) {
    if (error) {
      return console.log(error);
    }
    console.log('Message sent: ' + info.response);
  });


