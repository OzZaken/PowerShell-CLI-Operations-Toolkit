# First, we need to enable your Gmail account to receive connections from external programs.

# Open your browser and access your Gmail account.

# In our example, the following URL was entered in the Browser:
# On the login screen, enter your Gmail username and password.

# After the login, you need to access the following URL:

# • https://myaccount.google.com/signinoptions/two-step-verification

# Enable the two step verification on this account.

# After enabling the two step verification, you need to access the following URL:

# • https://security.google.com/settings/security/apppasswords

# Create an application password.

# Select the Gmail application and the type of device: Other.

# Click on the Generate button and take note of the randomly generated password.

# Next, you need to access the following URL:

# • https://accounts.google.com/DisplayUnlockCaptcha

# Click on the Continue button to enable external access to your Google account.

# You have finished the required steps for the Gmail integration.

# The Gmail integration will solve the following error.

# It will also solve this error.

# Send-MailMessage : The SMTP server requires a secure connection or the client was not authenticated. The server
# response was: 5.7.0 Authentication Required. Learn more at
# At line:1 char:1
# + Send-MailMessage -SmtpServer smtp.gmail.com -Port 587 -UseSsl -From v ...
# + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : InvalidOperation: (System.Net.Mail.SmtpClient:SmtpClient) [Send-MailMessage], SmtpExcept
#    ion
#     + FullyQualifiedErrorId : SmtpException,Microsoft.PowerShell.Commands.SendMailMessage

# Tutorial Powershell - Send email using Gmail


# Send the email with an attachment using Powershell.

# Use the Powershell command-line to send an email using Gmail.

$mycredentials = Get-Credential
Send-MailMessage -SmtpServer smtp.gmail.com -Port 587 -UseSsl -From virtualcoin.videos@gmail.com -To testaddress@gmail.com -Subject 'Test subject' -Body 'Test message' -Credential $mycredentials

# Enter the Gmail account credentials.

# If the test was successful, you will receive the sent message.

# Send the email with an attachment using Powershell.
$mycredentials = Get-Credential
Send-MailMessage -SmtpServer smtp.gmail.com -Port 587 -UseSsl -From virtualcoin.videos@gmail.com -To testaddress@gmail.com -Subject 'Test subject' -Body 'Test message' -Credential $mycredentials -Attachments "C:\MYFILE.TXT"

# Use Powershell to send an email using Gmail and a stored credential.
$userName = 'virtualcoin.videos@gmail.com'
$password = 'aaabbbccc'
[SecureString]$securepassword = $password | ConvertTo-SecureString -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securepassword
Send-MailMessage -SmtpServer smtp.gmail.com -Port 587 -UseSsl -From virtualcoin.videos@gmail.com -To goku@dbz.com -Subject 'Test subject' -Body 'Test message' -Credential $credential


# Use Powershell to send an email using Gmail and a credential.

$SMTP = "smtp.gmail.com"
$From = "virtualcoin.videos@gmail.com"
$To = "goku@dbz.com"
$Subject = "Test Subject"
$Body = "This is a test message"
$Email = New-Object Net.Mail.SmtpClient($SMTP, 587)
$Email.EnableSsl = $true
$Email.Credentials = New-Object System.Net.NetworkCredential("virtualcoin.videos@gmail.com", "password123qwe");
$Email.Send($From, $To, $Subject, $Body)