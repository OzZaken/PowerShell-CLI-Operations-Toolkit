param (
    [Parameter(Mandatory = $true)]
    [string]$computerName = "127.0.0.1",

    [Parameter(Mandatory = $true)]
    [string]$serviceName
)

try {
    $serviceStatus = Invoke-Command -ComputerName $computerName -ScriptBlock {
        Get-Service -Name $using:serviceName
    }

    $serviceStatus | Select-Object -Property @{Name="MachineName"; Expression={$computerName}}, Name, Status
}
catch {
    Write-Host "An error occurred while retrieving the service status:"
    Write-Host $_.Exception.Message
}