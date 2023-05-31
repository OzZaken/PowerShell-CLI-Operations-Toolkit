try {
    Write-Host "systeminfo:" -BackgroundColor DarkCyan
    systeminfo | Format-Table -AutoSize
    Write-Host 

    $computerSystem = Get-CimInstance CIM_ComputerSystem
    $computerBIOS = Get-CimInstance CIM_BIOSElement
    $computerOS = Get-CimInstance CIM_OperatingSystem
    $computerCPU = Get-CimInstance CIM_Processor
    $computerHDD = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"

    Write-Host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan
    "Manufacturer: " + $computerSystem.Manufacturer
    "Model: " + $computerSystem.Model
    "Serial Number: " + $computerBIOS.SerialNumber
    "CPU: " + $computerCPU.Name
    "HDD Capacity: " + "{0:N2}" -f ($computerHDD.Size / 1GB) + "GB"
    "HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace / $computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace / 1GB) + "GB)"
    "RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory / 1GB) + "GB"
    "Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
    "User logged In: " + $computerSystem.UserName
    "Last Reboot: " + $computerOS.LastBootUpTime
}
catch [System.UnauthorizedAccessException] {
    Write-Host "Access denied. Please run the script with administrative privileges." -ForegroundColor Red
}
catch [System.Management.Automation.PSInvalidOperationException] {
    Write-Host "An error occurred. Unable to retrieve system information." -ForegroundColor Red
}
catch {
    Write-Host "An unexpected error occurred." -ForegroundColor Red
}