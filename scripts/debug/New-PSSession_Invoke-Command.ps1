# List of target machine names or IP addresses
$targetMachines = "Machine1", "Machine2", "Machine3"

# Credentials for connecting to the machines (replace with your own)
$username = "YourUsername"
$password = "YourPassword"

# Loop through the target machines
foreach ($machine in $targetMachines) {
    # Create a PowerShell session to the target machine
    $session = New-PSSession -ComputerName $machine -Credential (Get-Credential -Credential $username)

    # Import the session to the current session
    Import-PSSession -Session $session -DisableNameChecking

    # Run commands on the target machine
    Invoke-Command -Session $session -ScriptBlock {
        # Commands to execute on the target machine
        # For example, Get-Process, Get-Service, etc.
    }

    # Remove the PowerShell session
    Remove-PSSession $session
}
