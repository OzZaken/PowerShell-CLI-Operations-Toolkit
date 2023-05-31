try {
    $HTMLDir = Join-Path -Path "$PSScriptRoot\html"
    Get-Process | ConvertTo-HTML -Property Name, Status > $HTMLDir
}
catch {
    return  "An error occurred: $_.Exception.Message"
}
