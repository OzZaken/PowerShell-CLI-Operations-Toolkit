# "Process": Sets the environment variable for the current PowerShell process only. The variable will not be available outside the current session or process.
# "User": Sets the environment variable for the current userMsg. The variable will be available to any processes or sessions started by that user.
# "Machine": Sets the environment variable for the entire machine. The variable will be available to all users and processes on the machine.
param (
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [Parameter(Mandatory = $true)]
    [string]$Val,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Machine", "User", "Process")]
    [string]$Scope
)

$WriteLog = Join-Path -Path $PSScriptRoot -ChildPath "Write-Log.ps1"

try {
    switch ($Scope) {
        "Machine" {
            [System.Environment]::SetEnvironmentVariable($Name, $Val, "Machine")
            # Invoke-Expression "$WriteLog -Message 'SetEnvironmentVariable [Machine-level] name: [$Name]  val: [$Val]' -FileName 'Set-EnvVar'"
        }
        "User" {
            [System.Environment]::SetEnvironmentVariable($Name, $Val, "User")
            # Invoke-Expression "$WriteLog -Message 'SetEnvironmentVariable [User-level] name: [$Name] value: [$Val]' -FileName 'Set-EnvVar'"
        }
        "Process" {
            [System.Environment]::SetEnvironmentVariable($Name, $Val, "Process")
            # Invoke-Expression "$WriteLog -Message 'SetEnvironmentVariable [Process-level] name: [$Name] value: [$Val]' -FileName 'Set-EnvVar'"
        }
    }
}
catch {
    Invoke-Expression "$WriteLog -Message 'Set Environment Variable name: [$Name] value: [$Val]' -FileName 'Set-EnvVar' -Severity 'Error'"
    Invoke-Expression "$WriteLog -Message '$($_.Exception.Message)' -FileName 'Create-EnvVar' -Severity 'Error'"
}