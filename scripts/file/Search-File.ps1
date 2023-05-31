# .\search.ps1 -path "C:\Users\ozzak\Desktop" -pattern "*CV*.pdf"

param (
    [string]$path,
    [string]$pattern
)

if ([string]::IsNullOrEmpty($path)) {
    $path = Read-Host "Enter the path:"
}

if ([string]::IsNullOrEmpty($pattern)) {
    $pattern = Read-Host "Enter the pattern:"
}

# Retrieve files and filter by pattern
$matchedFiles = Get-ChildItem -Path $path -Recurse | Where-Object { $_.Name -like $pattern } | Select-Object -ExpandProperty FullName

# Display the matched file paths
$matchedFiles