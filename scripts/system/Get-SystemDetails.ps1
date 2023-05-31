try {
    $networkAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' -and $_.PhysicalMediaType -ne 'WiFi' } | Select-Object -First 1

    if ($networkAdapter) {
        $ipAddress = $networkAdapter | Get-NetIPAddress -AddressFamily IPv4 | Select-Object -ExpandProperty IPAddress
        $dns = Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses
        $macAddress = $networkAdapter.MacAddress
        $hostname = $env:ComputerName
        $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
        $operatingSystem = $osInfo.Caption
        $currentUsername = $env:USERNAME

        $result = @{
            IPAddress       = $ipAddress
            DNS             = $dns
            MACAddress      = $macAddress
            Hostname        = $hostname
            OperatingSystem = $operatingSystem
            CurrentUser     = $currentUsername
        }
        Write-Host $result
        return $result
    }
    else {
        throw "No active network adapter found."
    }
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
    # Handle the error or perform additional error logging or actions
    return $null
}
