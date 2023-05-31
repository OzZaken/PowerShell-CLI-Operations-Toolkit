# Declare a parameter with the name 'memorySizeMB' and set its default value to 1
param (
    [Parameter(Mandatory = $true)]
    [int]$memorySizeMB = 1
)

# Print a message to the console
Write-Host "Get System Process Report`n" -ForegroundColor Yellow

try {
    # Get all processes running on the system
    $processes = Get-Process

    # Select the properties of each process and calculate memory usage in MB
    $processTable = $processes | Select-Object -Property Name, Id, Path, @{Name = "Memory (MB)"; Expression = { $_.WorkingSet / $memorySizeMB } }

    # Format the table and print it to the console
    $processTable | Format-Table -AutoSize -Property Name, Id, "Memory (MB)", Path

    # Create the 'html' directory if it doesn't exist
    $htmlPath = Join-Path -Path $PSScriptRoot -ChildPath "..\..\reports\html"
    if (-not (Test-Path $htmlPath)) {
        New-Item -ItemType Directory -Path $htmlPath | Out-Null
    }

    try {
        # Set the filename and path for the HTML file
        $fileName = "system_processes_report.html"
        $filePath = Join-Path -Path $htmlPath -ChildPath $fileName

        # Convert the table to HTML and save it to the specified file
        $processTable | ConvertTo-Html -Property Name, Id, "Memory (MB)", Path |
        Out-File -FilePath $filePath

        # Ask the user if they want to open the file
        $openFile = Read-Host "Do you want to open the HTML file? (Y/N)"

        # Check the user's response
        if ($openFile -eq "Y" -or $openFile -eq "y") {
            # Open the file using the default program
            Start-Process -FilePath $filePath
        }

        # Print the file path to the console
        Write-Host "HTML table saved to: $filePath"
    }
    catch {
        $errorMessage = "An error occurred while converting to HTML: $($_.Exception.Message)"
        throw $errorMessage
    }
}
catch {
    # Create a custom error message with details
    $errorMessage = "An error occurred while retrieving process information: $($_.Exception.Message)"
    $errorRecord = New-Object System.Management.Automation.ErrorRecord -ArgumentList (
        [System.Exception]::new($errorMessage),
        "ProcessInformationError",
        [System.Management.Automation.ErrorCategory]::OperationStopped,
        $null
    )

    # Log the error using a logging framework or Write-Host
    Write-Host $errorMessage

    # Throw the custom error to propagate it further
    throw $errorRecord
}