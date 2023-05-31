$systems = @(
    @{
        'hostname' = 'system1.example.com'
        'username' = 'username1'
        'password' = 'password1'
        'update_command' = 'apt-get update -y && apt-get upgrade -y'
    },
    @{
        'hostname' = 'system2.example.com'
        'username' = 'username2'
        'password' = 'password2'
        'update_command' = 'yum update -y'
    }
    # Add more systems as needed
)

foreach ($system in $systems) {
    Write-Host "Connecting to $($system['hostname'])..."
    $session = New-SSHSession -ComputerName $system['hostname'] -Credential (Get-Credential -UserName $system['username'] -Password $system['password'])
    
    Write-Host "Running update command on $($system['hostname'])..."
    $output = Invoke-SSHCommand -SessionId $session.SessionId -Command $system['update_command']
    
    Write-Host "Patch status on $($system['hostname']):"
    $output | ForEach-Object { Write-Host $_ }
    
    Remove-SSHSession -SessionId $session.SessionId
    Write-Host "Connection closed for $($system['hostname']).`n"
}
