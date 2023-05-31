$process_name = Read-Host "Enter the name of your application"

$process_object = Get-Process $process_name

if ($process_object.Responding) {
    Write-Host "$process_name is working correctly!"
}
else {
    Write-Host "$process_name isn't working correctly, closing.."
    $process_object.kill()
}