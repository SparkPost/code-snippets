#!/usr/bin/perl -w
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
# set to api.eu.sparkpost.com for EU accounts

use strict;
use warnings;

use LWP::UserAgent;
my $url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";
my $apiKey =  $ENV{'SPARKPOST_API_KEY'};  # API key from environment variable. Should have Recipient Validation rights
my $recipient = "test\@gmail.com";
my $shorturl = "api.sparkpost.com";


my (%params) = @_;
my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(
    'GET' =>
      $url.$recipient,
    [
        'Authorization'  => '$apiKey',
        'Accept'         => 'application/json',
        'Host'           => '$shorturl:443',
        'User-Agent'     => 'pcurl/1.0',
    ],
);


$req->header();
my $resp = $ua->request($req);
if ($resp->is_success) {
  my $message = $resp->decoded_content;
  my $json = JSON->new;
  my $data = $json->decode($message);
  return $data;
}
else {
print "HTTP GET error code: ", $resp->code, "\n";
print "HTTP GET error message: ", $resp->message, "\n";
}

__END__
