$adapterIndex = 1  # Specify the index of the network adapter you want to configure

$primaryDNS = "213.57.2.5"  # Specify the primary DNS server IP address
$secondaryDNS = "213.57.22.5"    # Specify the secondary DNS server IP address

$adapter = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.Index -eq $adapterIndex }
$dnsServers = @($primaryDNS, $secondaryDNS)

$adapter.SetDNSServerSearchOrder($dnsServers) | Out-Null

Write-Host "DNS servers updated successfully!"
