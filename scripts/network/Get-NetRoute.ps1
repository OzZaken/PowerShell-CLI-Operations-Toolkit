# Check Routing Table Configuration
Write-Host "Checking Routing Table Configuration..."

try {
    $routeConfig = Get-NetRoute -ErrorAction Stop | Select-Object -Property DestinationPrefix, NextHop, InterfaceAlias

    if ($routeConfig) {
        $routeConfig
    } else {
        Write-Host "No routing table entries found."
    }
} catch {
    Write-Host "An error occurred while retrieving the routing table entries: $($_.Exception.Message)"
}