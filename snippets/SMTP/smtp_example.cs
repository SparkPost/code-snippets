using System;
using System.Net;
using System.Net.Mail;
 
public class EmailTest
{
   public static void Main()
   {
        MailAddress to = new MailAddress("developers@sparkpost.com");
        MailAddress from = new MailAddress("testing@sparkpostbox.com");
  
        MailMessage mail = new MailMessage(from, to);
  
        mail.Subject = "Testing SparkPost SMTP from C#!";
  
        mail.Body = "Hello World!";
  
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.sparkpostmail.com";
        smtp.Port = 587;
 
        smtp.Credentials = new NetworkCredential(
            "SMTP_Injection", "<YOUR API KEY>");
 
        smtp.EnableSsl = true;
 
        Console.WriteLine("Sending email...");
        smtp.Send(mail);
 
        Console.WriteLine("Finished");
   }
}
