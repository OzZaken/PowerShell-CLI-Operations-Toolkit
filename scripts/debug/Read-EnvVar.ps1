$globalVariables = @(
    @{
        Name  = "Host.Name"
        Value = $Host.Name
    },
    @{
        Name  = "Host.Version"
        Value = $Host.Version
    },
    @{
        Name  = "VerbosePreference"
        Value = $VerbosePreference
    },
    @{
        Name  = "DebugPreference"
        Value = $DebugPreference
    },
    @{
        Name  = "WarningPreference"
        Value = $WarningPreference
    },
    @{
        Name  = "InformationPreference"
        Value = $InformationPreference
    },
    @{
        Name  = "PSScriptRoot"
        Value = $PSScriptRoot
    },
    @{
        Name  = "PSCommandPath"
        Value = $PSCommandPath
    },
    @{
        Name  = "PID"
        Value = $PID
    },
    @{
        Name  = "PROFILE"
        Value = $PROFILE
    },
    @{
        Name  = "HOME"
        Value = $HOME
    },
    @{
        Name  = "PSHome"
        Value = $PSHome
    },
    @{
        Name  = "PSEdition"
        Value = $PSEdition
    }
)

foreach ($variable in $globalVariables) {
    Write-Host "$($variable.Name): $($variable.Value)"
}