try {
    # Get the computer name
    $computerName = $env:COMPUTERNAME

    # Get the path for the report file
    $scriptPath = $MyInvocation.MyCommand.Path
    $reportFile = Join-Path -Path (Split-Path -Path $scriptPath -Parent) -ChildPath "..\..\reports\html\net_adapters_report-$computerName.html"

    # Retrieve network adapter information
    $adapters = Get-NetAdapter -Name "*" -IncludeHidden |
    Select-Object Name, InterfaceDescription, InterfaceName, DriverName, DriverDate

    # Generate HTML report
    $html = @"
    <!DOCTYPE html>
    <html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            .scrollable-table {
                max-height: 400px;
                overflow: auto;
            }
        </style>
    </head>
    <body>
        <h1>Network Adapter Information - Computer: $computerName</h1>
        <div class="scrollable-table">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Interface Description</th>
                    <th>Interface Name</th>
                    <th>Driver Name</th>
                    <th>Driver Date</th>
                </tr>
"@

    foreach ($adapter in $adapters) {
        $html += @"
                <tr>
                    <td>$($adapter.Name)</td>
                    <td>$($adapter.InterfaceDescription)</td>
                    <td>$($adapter.InterfaceName)</td>
                    <td>$($adapter.DriverName)</td>
                    <td>$($adapter.DriverDate)</td>
                </tr>
"@
    }

    $html += @"
            </table>
        </div>
    </body>
    </html>
"@
    # Check if the directory exists, create it if necessary
    $directory = Split-Path -Parent $reportFile
    if (-not (Test-Path -Path $directory -PathType Container)) {
        New-Item -ItemType Directory -Path $directory | Out-Null
    }

    # Save HTML report to a file
    $html | Out-File -FilePath $reportFile -ErrorAction Stop

    Write-Host "Report generated successfully at: $reportFile"

    # Ask the user if they want to open the file
    $openFile = Read-Host "Do you want to open the HTML file? (Y/N)"

    # Check the user's response
    if ($openFile -eq "Y" -or $openFile -eq "y") {
        # Open the file using the default program
        Start-Process -FilePath $reportFile
    }
} 
catch {
    Write-Host "An error occurred while generating the report:"
    Write-Host $_.Exception.Message
}
