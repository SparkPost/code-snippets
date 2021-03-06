# Note: This example depends on the latest version of Net::SMTP, along
# with IO::Socket::SSL to provide the necessary STARTTLS support.
# If these modules are out of date (or not present) on your system,
# you will need to install them from CPAN (http://www.cpan.org/modules/INSTALL.html)

use strict;
use warnings;
use Net::SMTP;

my $mailer = new Net::SMTP(
  'smtp.sparkpostmail.com',
  Port => 587,
  Debug => 1);

$mailer->starttls();

# You will need an API Key with 'Send via SMTP' permissions.
# Create one here: https://app.sparkpost.com/account/credentials
$mailer->auth('SMTP_Injection', '<YOUR API KEY>');

# sparkpostbox.com is a sending domain used for testing
# purposes and is limited to 50 messages per account.
# Visit https://app.sparkpost.com/account/sending-domains
# to register and verify your own sending domain.
my $from = 'testing@sparkpostbox.com';

my $to = 'recipient@example.com';

$mailer->mail($from);
$mailer->to($to);

my $msg =
  "Subject: Testing SparkPost SMTP from Perl!\r\n" .
  "To: $to\r\nFrom: $from\r\n\r\nHello World!";

$mailer->data($msg);
$mailer->quit;

print("Finished\n");
