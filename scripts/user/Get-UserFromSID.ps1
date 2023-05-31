param (
    [Parameter(Mandatory = $true)]
    [string]$SID
)

try {
    $user = [System.Security.Principal.SecurityIdentifier]::new($SID).Translate([System.Security.Principal.NTAccount])
    return $user.Value
}
catch {
    Write-Error "Failed to retrieve user from SID: $_"
}