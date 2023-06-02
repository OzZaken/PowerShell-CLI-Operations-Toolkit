# Get the HTTP headers using Powershell.
$url = 'http://techexpert.tips'
$result = Invoke-WebRequest -Method HEAD -Uri $url -UseBasicParsing
$result.RawContent


# Get the HTTP headers formatted as a table.
$url = 'http://techexpert.tips'
$result = Invoke-WebRequest -Method HEAD -Uri $url -UseBasicParsing
$result.Headers

# Get a specific item from the HTTP header.
$url = 'http://techexpert.tips'
$result = Invoke-WebRequest -Method HEAD -Uri $url -UseBasicParsing
$result.Headers.Date