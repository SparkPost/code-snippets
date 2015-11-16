// This example utilizes the 'nodemailer' and 'nodemailer-smtp-transport'
// modules which can be installed using the following commands:
// npm install nodemailer
// npm install nodemailer-smtp-transport
 
var nodemailer = require('nodemailer');
var smtpTransport = require('nodemailer-smtp-transport');
 
var transporter = nodemailer.createTransport(smtpTransport({
      host: 'smtp.sparkpostmail.com',
      port: 587,
      auth: {
        user: 'SMTP_Injection',
        pass: '<YOUR API KEY>'
      }
    }));
 
var mailData = {
  from: 'testing@sparkpostbox.com',
  to: 'developers@sparkpost.com',
  subject: 'Testing SparkPost SMTP from Node.js!',
  text: 'Hello World!'
};
 
transporter.sendMail(mailData, function(error, info) {
    if (error) {
      return console.log(error);
    }
    console.log('Message sent: ' + info.response);
  });
