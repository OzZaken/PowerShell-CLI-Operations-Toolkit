Write-Host "Checking IP Address Configuration...`n"

try {
    # Get-NetIpAddress | Format-Table -AutoSize
    $ipConfig = Get-NetIPAddress | Select-Object -Property InterfaceAlias, IPAddress, PrefixLength
    if ($ipConfig) {
        $ipConfig
    } else {
        Write-Host "No IP addresses found."
    }
} catch {
    Write-Host "An error occurred: "
    Write-Host "An error occurred while checking IP address configuration:`n$($_.Exception.Message)`n $_"
}
