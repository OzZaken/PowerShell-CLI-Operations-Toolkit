# Perform TraceRoute
Write-Host "Performing TraceRoute to $targetIPAddress..."
Test-NetConnection -Traceroute -ComputerName $targetIPAddress