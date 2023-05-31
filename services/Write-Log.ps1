
param (
    [Parameter(Mandatory = $true)]
    [string]$Message,

    [Parameter(Mandatory = $true)]
    [string]$FileName,

    [Parameter(Mandatory = $false)]
    [ValidateSet('Debug', 'Info', 'Warning', 'Error')]
    [string]$Severity = 'Debug'
)

$GetEnvVar = Join-Path -Path $PSScriptRoot -ChildPath "Get-EnvVar.ps1"

try {
    # Ensure the fileName path has .log extension
    if (-not ($FileName.EndsWith('.log', [StringComparison]::OrdinalIgnoreCase))) {
        $FileName += '.log'
    }

    $rootDir = Split-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path -Parent) -Parent
    $logsDir = Join-Path -Path $rootDir -ChildPath 'logs'
    
    # Two types of Logs
    $seasionLogFilePath = Join-Path -Path $logsDir -ChildPath  "$(Get-Date -Format "yyyy-MM-dd").log"
    $filePath = Join-Path -Path $logsDir -ChildPath "files\$FileName"

    # If files doesn't exist, create them both files
    if (-not (Test-Path -Path $filePath)) {
        New-Item -Path $filePath -ItemType File
    }
    
    if (-not (Test-Path -Path $seasionLogFilePath)) {
        New-Item -Path $seasionLogFilePath -ItemType File
    }

    # Get Current User
    $currentUser = Invoke-Expression "$GetEnvVar -Name 'PowerDesk_CURRENT_USER'"

    # Get current timestamp
    $timestamp = Get-Date -Format "HH:mm:ss"

    # Construct log entry
    $logEntry = "$timestamp - $Severity - $Message - by $currentUser "

    # Append log entry to the files
    Add-Content -Path $filePath -Value $logEntry
    Add-Content -Path $seasionLogFilePath -Value $logEntry

    # Debug: Output the log entry to the console
    Write-Host $logEntry -ForegroundColor Cyan
}
catch {
    Write-Host "An error occurred while writing to the log file: $_"
}