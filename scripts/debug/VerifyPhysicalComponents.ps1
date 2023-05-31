function VerifyPhysicalComponents {
    Write-Host "Physical Components:"
    $components = Get-CimInstance -Class Win32_PhysicalMemory | Select-Object -ExpandProperty Manufacturer -Unique
    if ($components) {
        Write-Host "Memory Manufacturers:"
        foreach ($component in $components) {
            Write-Host $component
        }
    }
    else {
        Write-Host "No physical memory found."
    }
    Write-Host "Physical Components Done"
}

VerifyPhysicalComponents
