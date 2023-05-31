Write-Host "NOTE: Use Enable-NetAdapter & Disable-NetAdapter"

try {
    $adapters = Get-NetAdapter
    # Get-NetIpAddress | Format-Table -AutoSize

    $table = @{}
    foreach ($adapter in $adapters) {
        $adapterName = $adapter.Name
        $connectionStatus = $adapter.Status
        $linkSpeed = $adapter.LinkSpeed
        $macAddress =$adapter.MacAddress

        $table[$adapterName] = @{
            "Adapter Name" = $adapterName
            "Connection Status" = $connectionStatus
            "LinkSpeed" = $linkSpeed
            "MAC Address" = $macAddress
        }
    }

    $tableValues = $table.Values | Select-Object "Adapter Name", "Connection Status", "LinkSpeed", "MAC Address"

    $tableValues | Format-Table -AutoSize
}
catch {
    Write-Host "An error occurred: $_"
    Write-Host "An error occurred: $($_.Exception.Message)"
}
