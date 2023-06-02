#  Get-Service | Where Status -eq Running
Get-Service | ? { $_.Status -eq 'Running' }