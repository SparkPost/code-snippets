#!/usr/bin/perl -w
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
# set to api.eu.sparkpost.com for EU accounts

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
#use JSON;                              # Only needed for a structured output
#use Data::Dumper;                      # Only needed for a structured output

my $url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";
my $apiKey =  $ENV{'SPARKPOST_API_KEY'};  # API key from environment variable. Should have Recipient Validation rights
my $recipient = 'test@gmail.com';
my $shorturl = "api.sparkpost.com";
my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(
    'GET' =>
      $url.$recipient,
    [
        'Authorization'  => "$apiKey",
        'Accept'         => "application/json",
        'Host'           => "$shorturl:443",
    ],
);
my $resp = $ua->request($req);
if ($resp->is_success) {
  my $message = $resp->decoded_content;
#  my $json = JSON->new;                # Only needed for a structured output]
#  my $data = $json->decode($message);  # Only needed for a structured output

  print $message,"\r\n";
#  print Dumper($data);                 # Only needed for a structured output

}
else {
  print "HTTP GET error code: ", $resp->code, "\n";
  print "HTTP GET error message: ", $resp->message, "\n";
}

__END__
