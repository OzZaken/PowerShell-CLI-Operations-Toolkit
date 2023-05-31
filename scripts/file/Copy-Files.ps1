param (
    [Parameter(Mandatory = $true)]
    [string]$Path,
    [Parameter(Mandatory = $true)]
    [string]$Destination,
    [Parameter(Mandatory = $true)]
    [string]$Filter
)

try {
    # If process name is not provided, get it from user input
    if ([string]::IsNullOrEmpty($Path)) {
        $Path = Read-Host "Enter the source path:"
    }
    # If destination is not provided, get it from user input
    if ([string]::IsNullOrEmpty($Destination)) {
        $Destination = Read-Host "Enter the destination path:"
    }
    # If filter is not provided, get it from user input
    if ([string]::IsNullOrEmpty($Filter)) {
        $Filter = Read-Host "Enter the filter:"
    }

    # Create the destination directory if it doesn't exist
    if (-not (Test-Path -Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination | Out-Null
    }

    # Copy items matching the filter from the source path to the destination path recursively
    $copiedItems = Get-ChildItem -Path $Path -Filter $Filter -Recurse | Copy-Item -Destination $Destination -ErrorAction Stop

    Write-Host "Files copied successfully!"
    $copiedItems | ForEach-Object {
        $copiedFile = $_.FullName
        Write-Host "Copied: $copiedFile"
    }
    Write-Host "Total files copied: $($copiedItems.Count)"
} 
catch {
    $errorMessage = "An error occurred: $($_.Exception.Message)"
    Write-Host $errorMessage
}
