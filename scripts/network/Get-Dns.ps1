try {
    $networkConfig = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null }
    $dnsServers = $networkConfig.DNSServerSearchOrder

    Write-Host "DNS Servers:"
    foreach ($dnsServer in $dnsServers) {
        Write-Host $dnsServer
    }

    Write-Host "DNS servers logged to $logFilePath"
}
catch {
    $errorMessage = "An error occurred: $($_.Exception.Message)"
    Write-Host $errorMessage
}