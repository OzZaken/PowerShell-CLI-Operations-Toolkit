try {
    systeminfo
}
catch {
    # Handle the terminating exception
    Write-Host "An error occurred while retrieving the MAC address."
    Write-Host "Exception message: $_"
}
