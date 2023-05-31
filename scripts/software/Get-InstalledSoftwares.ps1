Write-Host "Getting installed software..."

try {
    $installedSoftware = Get-CimInstance Win32_Product | Select-Object Name, Version

    $totalCount = $installedSoftware.Count

    Write-Host "$totalCount Installed software retrieved."

    $installedSoftware | Format-Table -AutoSize
    
}
catch {
    Write-Host "Failed to display installed software."
    Write-Host "Error: $_"
}
