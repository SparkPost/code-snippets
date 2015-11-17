using System;
using System.Net;
using System.Net.Mail;
 
public class EmailTest
{
   public static void Main()
   {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.sparkpostmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
 
        // You will need an API Key with 'Send via SMTP' permissions.
        // Create one here: https://app.sparkpost.com/account/credentials
        smtp.Credentials = new NetworkCredential(
            "SMTP_Injection", "<YOUR API KEY>");

        // sparkpostbox.com is a sending domain used for testing
        // purposes and is limited to 50 messages per account.
        // Visit https://app.sparkpost.com/account/sending-domains
        // to register and verify your own sending domain.
        MailAddress from = new MailAddress("testing@sparkpostbox.com");

        MailAddress to = new MailAddress("recipient@example.com");
        MailMessage mail = new MailMessage(from, to);

        mail.Subject = "Testing SparkPost SMTP from C#!";
        mail.Body = "Hello World!";
 
        Console.WriteLine("Sending email...");
        smtp.Send(mail);
 
        Console.WriteLine("Finished");
   }
}
