try {
    Restart-Service -Name Spooler -ErrorAction Stop
    Write-Host "The Print Spooler service has been successfully restarted."
}
catch {
    $errorMessage = $_.Exception.Message
    Write-Host "An error occurred while trying to restart the Print Spooler service: $errorMessage"
}