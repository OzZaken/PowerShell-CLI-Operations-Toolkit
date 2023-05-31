$dnsServer = "8.8.8.8"  # Specify the DNS server IP address

try {
    $dns = Get-CimInstance -Namespace "root\MicrosoftDNS" -ClassName "MicrosoftDNS_Server" -ComputerName "." -ErrorAction Stop | Where-Object { $_.IPAddress -eq $dnsServer }

    if ($dns) {
        $dnsInfo = @{
            "IP Address"         = $dns.IPAddress
            "Name"               = $dns.Name
            "Server Type"        = $dns.ServerType
            "Forwarders"         = $dns.Forwarders
            "Zone Count"         = $dns.ZoneCount
            "Forwarding Enabled" = $dns.ForwardingEnabled
            "Allow Update"       = $dns.AllowUpdate
        }

        $dnsInfo | Format-Table -AutoSize
    }
    else {
        Write-Host "DNS server not found."
    }
}
catch {
    Write-Host "An error occurred while retrieving DNS server information: $($_.Exception.Message)"
}