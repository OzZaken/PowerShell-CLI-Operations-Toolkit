param (
    [Parameter(Mandatory = $true)]
    [string]$Msg
)

$ChangesFile = Join-Path -Path $PSScriptRoot -ChildPath "..\CHANGES.md"
Write-Host $ChangesFile
$WriteLog = Join-Path -Path $PSScriptRoot -ChildPath "Write-Log.ps1"

try {
    $dateOfChange = Get-Date -Format "MMM dd, yyyy"

    $currentUser = $env:PowerDesk_CURRENT_USER

    $line = "| $dateOfChange  | $Msg | $currentUser |"

    Add-Content -Path $ChangesFile -Value $line
    # Invoke-Expression "$WriteLog -Message 'Line added successfully'  -FileName '$(Get-Date -Format "yyyy-MM-dd")' -Severity 'Info'"
}
catch {
    Invoke-Expression "$WriteLog -Message 'Error occurred while adding line to changes file'  -FileName '$(Get-Date -Format "yyyy-MM-dd")' -Severity 'Error'"
    Invoke-Expression "$WriteLog -Message $($_.Exception.Message)  -FileName 'Log-Changes' -Severity 'Error'"
    Write-Host 
}
