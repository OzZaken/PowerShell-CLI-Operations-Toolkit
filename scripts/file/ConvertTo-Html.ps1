param (
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path $_ -PathType 'Leaf' })]
    [String]$Path
)

try {
    $content = Get-Content -Path $Path
    $html = ConvertTo-Html -InputObject $content | Out-String
    $html
}
catch {
    Write-Error "Error: $_"
}
