$WriteLog = Join-Path -Path $PSScriptRoot -ChildPath "Write-Log.ps1"
$ReadSystem = Join-Path -Path $PSScriptRoot -ChildPath "Read-System.ps1"
$SetEnvVar = Join-Path -Path $PSScriptRoot -ChildPath "Set-EnvVar.ps1"

# Store the number of attempts made by the user
$attempts = 0

try {
    # While loop to keep prompting the user until 3 attempts are made
    while ($attempts -lt 3) {
        $username = Read-Host "`nEnter a username" # Prompt the user to enter a username

        # Username validation 
        if ([string]::IsNullOrWhiteSpace($username)) {
            Write-Host "Username cannot be empty. Please try again."
            $attempts++ # Increment the attempt count
        }
        elseif ($username -match "[^\w.-]") {
            Write-Host "Username contains special characters. Please try again."
            $attempts++
        }
        # Valid username 
        else {
            # Get the path of the valid users
            $usersFile = Join-Path -Path $PSScriptRoot -ChildPath "..\config\POWERDESK_USERS.txt"
            $contributersFile = Join-Path -Path $PSScriptRoot -ChildPath "..\config\CONTRIBUTERS.txt"

            # Get the list of valid users from the files
            $validPowerdeskUsers = Get-Content -Path $usersFile
            $validContributersUsers = Get-Content -Path $contributersFile

            # Check if the username exists in either of the files
            if ($validPowerdeskUsers -contains $username -or $validContributersUsers -contains $username) {
                # SetEnvVar $isContributor
                $isContributor = $validContributersUsers -contains $username
                Invoke-Expression "$SetEnvVar -Name 'isContributor' -Val '$isContributor' -Scope 'Process'"
                return $username 
            }
            # If the username does not exist in either of the files
            else {
                Write-Host "Username does not exist. Please try again or read the README.md file."
                $attempts++
            }
        }
    }

    $systemDetails = Invoke-Expression "$ReadSystem"

    # Logging a warning message with the system details
    Invoke-Expression "$WriteLog -Message 'Three unsuccessful attempts  system details' -FileName '$(Get-Date -Format 'yyyy-MM-dd')' -Severity 'Warning'"
    Invoke-Expression "$WriteLog -Message '$($systemDetails | Format-Table  -AutoSize  | Out-String)' -FileName 'warning\login' -Severity 'Warning'"
}
catch {
    # Error handling
    Invoke-Expression "$WriteLog -Message 'Get-User' -FileName '$(Get-Date -Format 'yyyy-MM-dd')' -Severity 'Error'"
    Invoke-Expression "$WriteLog -Message '$($_.Exception.Message)' -FileName 'Get-User' -Severity 'Error'"
}

break