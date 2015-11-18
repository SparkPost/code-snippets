import smtplib

server = smtplib.SMTP('smtp.sparkpostmail.com', 587)
server.set_debuglevel(1)
server.starttls()

# You will need an API Key with 'Send via SMTP' permissions.
# Create one here: https://app.sparkpost.com/account/credentials
server.login('SMTP_Injection', '<YOUR API KEY>')

# sparkpostbox.com is a sending domain used for testing
# purposes and is limited to 50 messages per account.
# Visit https://app.sparkpost.com/account/sending-domains
# to register and verify your own sending domain.
FROMADDR = 'testing@sparkpostbox.com'

TOADDRS = ['recipient@example.com']
SUBJECT = 'Testing SparkPost SMTP from Python!'

msg = ("From: %s\r\nTo: %s\r\nSubject: %s\r\n\r\nHello World!"
       % (FROMADDR, ", ".join(TOADDRS), SUBJECT))

server.sendmail(FROMADDR, TOADDRS, msg)
server.quit()
 
print("Finished")
