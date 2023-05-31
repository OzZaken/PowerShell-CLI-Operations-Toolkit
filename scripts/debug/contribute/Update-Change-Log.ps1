param (
    [Parameter(Mandatory = $true)]
    [string]$Msg
)
$debugDir = Split-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path -Parent) -Parent
$scriptsDir = Split-Path -Path $debugDir -Parent
$rootDir = Split-Path -Path $scriptsDir -Parent

$AddLogChange = Join-Path -Path $rootDir -ChildPath 'services\Log-Change.ps1'
$WriteLog = Join-Path -Path $rootDir -ChildPath "services\Write-Log.ps1"

try {
    Invoke-Expression "$AddLogChange -Msg '$Msg'"
    Invoke-Expression "$WriteLog -Message 'AddLogChange' -FileName 'Create-LogChange' -Severity 'Debug'"
}
catch {
    Invoke-Expression "$WriteLog -Message '$Msg' -FileName 'Create-LogChange' -Severity 'Error'"
}
