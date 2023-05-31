# FilePath – file location
# Leaf – Check for file and not directory
param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)
Test-Path -Path $Path