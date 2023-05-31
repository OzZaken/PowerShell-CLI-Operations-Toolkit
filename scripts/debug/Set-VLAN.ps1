Add-Type -Path "path\to\SSH.NET.dll" # Path to SSH.NET library

# SSH connection details
$swtich = "192.168.1.1"  # IP address of the switch
$username = "your_username"
$password = "your_password"

# Prompt for VLAN and interface name
$vlanId = Read-Host "Enter VLAN ID"
$interfaceName = Read-Host "Enter interface name (e.g., GigabitEthernet1/0/1)"

# SSH connection setup
$sshClient = New-Object Renci.SshNet.SshClient($swtich, $username, $password)

try {
    $sshClient.Connect()
    Write-Host "SSH connection established."

    # Send commands to change VLAN and interface name
    $commands = @"
    vlan $vlanId
    interface $interfaceName
    switchport access vlan $vlanId
    description $($interfaceName -replace "/", "-")
    write memory
"@

    $sshClient.RunCommand($commands)

    Write-Host "VLAN and interface name changed successfully."

} catch {
    Write-Host "Failed to establish SSH connection: $($_.Exception.Message)"
} finally {
    $sshClient.Disconnect()
}
