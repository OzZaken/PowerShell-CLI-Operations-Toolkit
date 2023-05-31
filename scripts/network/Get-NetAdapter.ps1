try {
    # Retrieve network adapter information
    $networkAdapters = Get-NetAdapter -Name "*" -IncludeHidden | Format-List -Property "Name", "InterfaceDescription", "InterfaceName", "DriverName", "DriverDate"

    # Output the network adapter information to the console
    $networkAdapters
}
catch {
    # Log the error using a logging framework or Write-Host
    Write-Host "An error occurred while retrieving network adapter information: $($_.Exception.Message)"
}