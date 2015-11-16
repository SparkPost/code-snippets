import smtplib
 
FROMADDR = 'testing@sparkpostbox.com'
TOADDRS  = ['developers@sparkpost.com']
SUBJECT  = 'Testing SparkPost SMTP from Python!'
 
msg = ("From: %s\r\nTo: %s\r\nSubject: %s\r\n\r\nHello World!"
       % (FROMADDR, ", ".join(TOADDRS), SUBJECT) )
 
server = smtplib.SMTP('smtp.sparkpostmail.com', 587)
server.set_debuglevel(1)
server.starttls()
server.login('SMTP_Injection', '<YOUR API KEY>')
server.sendmail(FROMADDR, TOADDRS, msg)
server.quit()
 
print("Finished")
