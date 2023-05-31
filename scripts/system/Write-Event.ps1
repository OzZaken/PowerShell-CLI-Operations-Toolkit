param (
    [Parameter(Mandatory = $true)]
    [string]$Message,
    [ValidateSet("Information", "Critical", "Error")]
    [Parameter(Mandatory = $true)]
    [string]$Severity
)

try {
    # Generate a random Event ID
    $eventID = Get-Random -Minimum 1000 -Maximum 9999

    # Create a new event log if it doesn't exist
    $eventSource = "PowerDesk EVENT"
    $logName = "Application"

    if (-not [System.Diagnostics.EventLog]::SourceExists($eventSource)) {
        [System.Diagnostics.EventLog]::CreateEventSource($eventSource, $logName)
    }

    # Map the severity string to the EventLogEntryType enumeration value
    $severityMapping = @{
        "Information" = [System.Diagnostics.EventLogEntryType]::Information
        "Critical" = [System.Diagnostics.EventLogEntryType]::Error
        "Error" = [System.Diagnostics.EventLogEntryType]::Error
    }

    # Get the EventLogEntryType based on the severity string
    $eventLogEntryType = $severityMapping[$Severity]

    # Write the event log
    $eventLog = New-Object System.Diagnostics.EventLog($logName)
    $eventLog.Source = $eventSource
    $eventLog.WriteEntry($Message, $eventLogEntryType, $eventID)

    Write-Host "Event logged successfully with ID: $eventID"
}
catch {
    Write-Host "An error occurred while logging the event: $($_.Exception.Message)"
}
