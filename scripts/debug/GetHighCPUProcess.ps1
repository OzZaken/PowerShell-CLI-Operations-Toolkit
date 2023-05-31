param (
    [string]$cpu
)

if ([string]::IsNullOrEmpty($cpu)) {
    $cpu = Read-Host "Enter the CPU threshold value:"
}

$processes = Get-Process | Where-Object { $_.CPU -gt $cpu }

if ($processes) {
    $processes | Format-Table -AutoSize
}
else {
    Write-Host "No processes found exceeding the CPU threshold of $cpu"
}
