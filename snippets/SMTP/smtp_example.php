<?php

// This example uses the PHPMailer library:
// https://github.com/PHPMailer/PHPMailer

require 'PHPMailerAutoload.php';

$mail = new PHPMailer;

$mail->SMTPDebug = 3;

$mail->isSMTP();
$mail->Host = 'smtp.sparkpostmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'SMTP_Injection';
$mail->Password = '<YOUR API KEY>';
$mail->SMTPSecure = 'tls';
$mail->Port = 587;

$mail->setFrom('testing@sparkpostbox.com');
$mail->addAddress('developers@sparkpost.com');

$mail->Subject = 'Testing SparkPost SMTP from PHP!';
$mail->Body    = 'Hello World!';

if (!$mail->send()) {
  echo "Message could not be sent\n";
  echo "Mailer Error: " . $mail->ErrorInfo . "\n";
} else {
  echo "Message has been sent\n";
}
