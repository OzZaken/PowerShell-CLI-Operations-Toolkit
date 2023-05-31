param (
    [Parameter(Mandatory = $true)]
    [string]$ipAddress
)

try {
    Write-Output "Pinging $ipAddress..."
    ping $ipAddress
} catch {
    Write-Host "An error occurred while pinging $ipAddress : $($_.Exception.Message)"
}
