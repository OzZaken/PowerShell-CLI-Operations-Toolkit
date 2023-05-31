try {
    Get-NetAdapterStatistics | Format-Table -AutoSize
}
catch {
    Write-Host "An error occurred: $($_.Exception.Message)"
}