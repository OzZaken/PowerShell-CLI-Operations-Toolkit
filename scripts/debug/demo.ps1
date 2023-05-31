function Get-ScriptName {
    param (
        [Parameter(Mandatory=$false, Position=0)]
        [string]$ScriptPath = $MyInvocation.MyCommand.Path
    )

    try {
        $ScriptName = Split-Path -Path $ScriptPath -Leaf
        $ScriptName = $ScriptName -replace '\.(.*?)$'
        Write-Host "Script Name: $ScriptName"
    }
    catch {
        Write-Error "Error: $_"
        <# Handle the error here if needed #>
    }
}

Get-ScriptName