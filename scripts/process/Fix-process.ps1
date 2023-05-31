# .\ProcessManagement.ps1 -ProcessName "notepad"

param (
    [string]$ProcessName
)

# If process name is not provided, get it from user input
if ([string]::IsNullOrEmpty($ProcessName)) {
    $ProcessName = Read-Host "Enter the process name:"
}

# Check if process exists
$process = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

if ($process) {
    $processTable = @{
        'Process Name' = $ProcessName
        'Process ID' = $process.Id
        'Path' = $process.Path
        'Memory (MB)' = $process.WorkingSet / 1MB
    }
    
    $processTable | Format-Table
    }
else {
    Write-Host "Process '$ProcessName' is not currently running."
}

# Option to restart the process
$restart = Read-Host "Do you want to restart the process? (Y/N)"

if ($restart -eq "Y" -or $restart -eq "y") {
    # Check if the process is already running
    if ($process) {
        Write-Host "Stopping process '$ProcessName'..."
        $process | Stop-Process -Force
    }

    # Start the process
    Write-Host "Starting process '$ProcessName'..."
    Start-Process -FilePath $ProcessName
}
