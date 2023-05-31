# Prompt user for an IP address
$targetIPAddress = Read-Host "Enter the IP address to ping"

# Check connectivity to the specified IP address
Write-Host "Checking connectivity to $targetIPAddress..."

Test-NetConnection -ComputerName $targetIPAddress
