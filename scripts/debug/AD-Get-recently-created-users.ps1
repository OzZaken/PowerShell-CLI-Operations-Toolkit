# Find user accounts recently created
$Days = 10
$Time = (Get-Date).Adddays(-($Days))
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, WhenCreated


# Optionally, export the result as a CSV file.
$Days = 10
$Time = (Get-Date).Adddays(-($Days))
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | Select Name, whenCreated | export-csv users.csv


# Find user accounts created on Active Directory in the last 30 days.

$Days = 30
$Time = (Get-Date).Adddays(-($Days))
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, WhenCreated
