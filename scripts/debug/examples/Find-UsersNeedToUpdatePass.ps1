Find users in Active Directory with a password older than 10 days.
$Days = 10
$Time = [DateTime]::Today.AddDays(-$Days)
Get-ADUser -Filter '(PasswordLastSet -lt $Time)' -Properties PasswordLastSet | ft Name,PasswordLastSet

# Optionally, export the result as a CSV file.
$Days = 10
$Time = [DateTime]::Today.AddDays(-$Days)
Get-ADUser -Filter '(PasswordLastSet -lt $Time)' -Properties * | Select Name, PasswordLastSet | export-csv oldpasswords.csv

# Find users in Active Directory with a password older than 30 days.
$Days = 30
$Time = [DateTime]::Today.AddDays(-$Days)
Get-ADUser -Filter '(PasswordLastSet -lt $Time)' -Properties PasswordLastSet | ft Name,PasswordLastSet

# Find users in Active Directory with a password older than 90 days.
$Days = 90
$Time = [DateTime]::Today.AddDays(-$Days)
Get-ADUser -Filter '(PasswordLastSet -lt $Time)' -Properties PasswordLastSet | ft Name,PasswordLastSet