<?php
// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
// set to api.eu.sparkpost.com for EU accounts
$url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";

$apiKey = getenv('SPARKPOST_API_KEY');  // API key from environment variable. Should have Recipient Validation rights
$recipient = "test@gmail.com";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url.$recipient);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HEADER, FALSE);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
  "Accept: application/json",
  "Authorization: $apiKey"
));

$response = curl_exec($ch);
curl_close($ch);

var_dump($response);

?>
