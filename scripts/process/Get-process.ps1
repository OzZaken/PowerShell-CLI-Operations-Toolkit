param (
    [int]$Id,
    [string]$Name
)

# If both Id and Name are not provided, get them from user input
if (-not $Id -and [string]::IsNullOrEmpty($Name)) {
    $input = Read-Host "Enter the process Id or Name:"
    
    # Check if input is a number (Id)
    if ($input -as [int]) {
        $Id = [int]$input
    }
    else {
        $Name = $input
    }
}

# Check if process exists
$process = $null

if ($Id) {
    $process = Get-Process -Id $Id -ErrorAction SilentlyContinue
}
elseif ($Name) {
    $process = Get-Process -Name $Name -ErrorAction SilentlyContinue
}

if ($process) {
    $processTable = @{
        'Process Name' = $process.ProcessName
        'Process ID' = $process.Id
        'Path' = $process.Path
        'Memory (MB)' = $process.WorkingSet / 1MB
    }
    
    $processTable | Format-Table
}
else {
    Write-Host "Process with Id '$Id' or Name '$Name' is not currently running."
}
