param(
    [Parameter(Mandatory = $true)]
    [int]$port,   
    [Parameter(Mandatory = $true)]
    [string]$ipAddress
)
try {
    # Check connectivity to the specified port on the IP address
    Write-Host "Checking connectivity to port $port on $ipAddress...`n" -ForegroundColor Cyan
    Test-NetConnection -ComputerName $ipAddress -Port $port
}
catch {
    Write-Error "Error Checking connectivity to port $port on $ipAddress..."
}