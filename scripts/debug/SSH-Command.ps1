$sshSession = New-SSHSession -ComputerName <hostname> -Credential (Get-Credential)

if ($sshSession) {
    Invoke-SSHCommand -SessionId $sshSession.SessionId -Command "<command>"
    Remove-SSHSession -SessionId $sshSession.SessionId
}

# Replace <hostname> with the IP address or hostname of the remote machine you want to connect to. The Get-Credential cmdlet prompts you to enter the username and password for authentication.

# In the Invoke-SSHCommand line, replace <command> with the command you want to execute on the remote machine.

# This script uses the New-SSHSession cmdlet from the SSHUtils module in PowerShell to create an SSH session, Invoke-SSHCommand to execute a command on the remote machine, and Remove-SSHSession to close the SSH session when you're done.

# Make sure you have the SSHUtils module installed on your system before running this script. You can install it using the following command: