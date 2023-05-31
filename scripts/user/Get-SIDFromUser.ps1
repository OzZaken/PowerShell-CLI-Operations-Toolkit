param (
    [Parameter(Mandatory = $true)]
    [string]$Username
)

try {
    $user = New-Object System.Security.Principal.NTAccount($Username)
    $sid = $user.Translate([System.Security.Principal.SecurityIdentifier])
    return $sid.Value
}
catch {
    Write-Error "Failed to retrieve SID from username: $_"
}