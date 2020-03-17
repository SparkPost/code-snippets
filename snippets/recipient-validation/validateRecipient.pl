#!/usr/bin/perl -w
# API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
# set to api.eu.sparkpost.com for EU accounts

# Do this first:
# cpan install LWP::Protocol::https
# cpan install JSON
# export SPARKPOST_API_KEY=191c<redactedredacted>c531c3

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
use JSON;
use Data::Dumper;
my $url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";
my $apiKey =  $ENV{'SPARKPOST_API_KEY'};  # API key from environment variable. Should have Recipient Validation rights
my $recipient = "test\@gmail.com";
my $shorturl = "api.sparkpost.com";
my $certpath = "/etc/pki/tls/certs/";


# specify a CA path
my $ua = LWP::UserAgent->new(
    ssl_opts => {
        SSL_ca_path     => "$certpath",
        verify_hostname => 1,
    },
    agent => "Perl API Client/1.0"
);


my @headers = (
   'Authorization' => "$apiKey");

my $res = $ua->get($url.$recipient,@headers);

if ($res->is_success) {
  my $message = $res->decoded_content;
  my $json = JSON->new;
  my $data = $json->decode($message);
  print Dumper($data);
}
else {
print "HTTP GET error code: ", $res->code, "\n";
print "HTTP GET error message: ", $res->message, "\n";
}
