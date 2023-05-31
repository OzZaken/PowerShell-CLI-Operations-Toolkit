# Configure the Proxy server using Powershell.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value "10.10.10.10:3128"

# Enable the Proxy server utilization.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -Value 1

# Verify the Proxy configuration using Powershell.
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object ProxyEnable, ProxyServer, ProxyOverride, AutoConfigURL, ProxyUser, ProxyPass

# Disable the Proxy server utilization.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -Value 0

# Congratulations! You are able to configure Proxy on Windows using Powershell.

# Configure to not use a Proxy for local addresses.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "<local>"

# Configure the Proxy exclusion list.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "<local>;techexpert.tips;*.google.com;*.microsoft.com"

# Configure the Proxy automatic configuration script.
Set-ItemProperty -Path  'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name AutoConfigURL -value 'http://10.10.10.10/proxy.pac'

#Disable the Proxy automatic configuration script.
Set-ItemProperty -Path  'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name AutoConfigURL -value ''

# Save a credential for Proxy authentication.
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyUser -Value "benjamin"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyPass -Value "123qwe"

# Delete a saved credential for Proxy authentication.
Remove-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyUser -Force
Remove-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -Name ProxyPass -Force

# Congratulations! You are able to configure Proxy on Windows using Powershell.