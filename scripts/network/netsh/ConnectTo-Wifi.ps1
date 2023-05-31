try {
    Write-Host "Available Wi-Fi Networks:"
    netsh wlan show networks

    $ssid = Read-Host "Enter the name (SSID) of the Wi-Fi network to connect to:"

    netsh wlan connect name="$ssid"

    Write-Host "Connecting to $ssid..."
    Start-Sleep -Seconds 5  # Wait for connection to be established

    Write-Host "Wi-Fi Interfaces:"
    netsh wlan show interfaces
}
catch {
    Write-Host "An error occurred while connecting to the Wi-Fi network:"
    Write-Host $_.Exception.Message
}