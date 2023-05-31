param (
    [Parameter(Mandatory = $true)]
    [string]$Name
)

try {
    $Val = [System.Environment]::GetEnvironmentVariable($Name)
    if ([string]::IsNullOrEmpty($Val)) {
        return 'UNKNOWN'
    } else {
        return $Val
    }
}
catch {
    Write-Host "An error occurred while retrieving the environment variable:"
    Write-Host $_.Exception.Message
}
