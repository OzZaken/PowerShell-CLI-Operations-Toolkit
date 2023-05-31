try {
    $battery = Get-CimInstance -ClassName CIM_Battery -ErrorAction Stop

    if ($battery) {
        $systemName = $battery | Select-Object -ExpandProperty SystemName
        $powerStatus = $battery | Select-Object -ExpandProperty BatteryStatus

        $powerStatusString = switch ($powerStatus) {
            1 { "Battery is discharging." }
            2 { "Battery is idle." }
            3 { "Battery is charging." }
            4 { "Battery is fully charged." }
            default { "Power status is unknown." }
        }

        Write-Host "Power Supply on $systemName : $powerStatusString"

        $batteryInfo = $battery | Select-Object  Name, Status, SystemCreationClassName, DeviceID

        $batteryInfo | Format-Table -AutoSize
    }
} catch {
    Write-Host "An error occurred while retrieving battery information: $($_.Exception.Message)"
}
