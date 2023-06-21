param (
    [Parameter(Mandatory = $true)]
    [string]$ipAddress
)

try {
    Write-Output "nmap -sP $ipAddress..."
    nmap -sP $ipAddress
} catch {
    Write-Host "An error occurred while nmap -sP $ipAddress : $($_.Exception.Message)"
}
