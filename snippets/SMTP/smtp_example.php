<?php

// This example uses the PHPMailer library:
// https://github.com/PHPMailer/PHPMailer

require 'PHPMailerAutoload.php';

$mail = new PHPMailer;

$mail->SMTPDebug = 3;

$mail->isSMTP();
$mail->Host = 'smtp.sparkpostmail.com';
$mail->Port = 587;
$mail->SMTPSecure = 'tls';
$mail->SMTPAuth = true;
$mail->Username = 'SMTP_Injection';

// You will need an API Key with 'Send via SMTP' permissions.
// Create one here: https://app.sparkpost.com/account/credentials
$mail->Password = '<YOUR API KEY>';

// sparkpostbox.com is a sending domain used for testing
// purposes and is limited to 5 messages per account.
// Visit https://app.sparkpost.com/account/sending-domains
// to register and verify your own sending domain.
$mail->setFrom('testing@sparkpostbox.com');

$mail->addAddress('recipient@example.com');
$mail->Subject = 'Testing SparkPost SMTP from PHP!';
$mail->Body    = 'Hello World!';
$mail->addCustomHeader('X-MSYS-API', '{"campaign_id" : "PHPExample"}');

if (!$mail->send()) {
  echo "Message could not be sent\n";
  echo "Mailer Error: " . $mail->ErrorInfo . "\n";
} else {
  echo "Message has been sent\n";
}
