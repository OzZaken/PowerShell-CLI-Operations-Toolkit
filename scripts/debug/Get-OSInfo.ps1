# Function to get operating system information
function Get-OSInfo {
    $osInfo = @{
        'OS' = (Get-WmiObject Win32_OperatingSystem).Caption
        'OS Version' = (Get-WmiObject Win32_OperatingSystem).Version
        'Architecture' = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
    }

    return $osInfo
}

$osInfo = Get-OSInfo

$osInfo.GetEnumerator() | ForEach-Object {
    Write-Host $_.Key
    Write-Host ('-' * $_.Key.Length)
    Write-Host $_.Value
    Write-Host
}