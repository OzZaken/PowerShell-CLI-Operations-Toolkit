# Show Process Environment Variables
function Show-ProcessEnv {
    try {
        $processEnv = Get-ChildItem -Path "Env:" -ErrorAction Stop | Select-Object -ExpandProperty Name
        Write-Host "Process Environment Variables:"
        foreach ($variable in $processEnv) {
            $value = [Environment]::GetEnvironmentVariable($variable, "Process")
            Write-Host "$variable = $value"
        }
        Write-Host
    }
    catch {
        Write-Host "Failed to retrieve Process Environment Variables: $_"
    }
}

# Show Machine Environment Variables
function Show-MachineEnv {
    try {
        $machineEnv = [Environment]::GetEnvironmentVariables("Machine")
        Write-Host "Machine Environment Variables:"
        foreach ($variable in $machineEnv.GetEnumerator()) {
            $name = $variable.Key
            $value = $variable.Value
            Write-Host "$name = $value"
        }
        Write-Host
    }
    catch {
        Write-Host "Failed to retrieve Machine Environment Variables: $_"
    }
}

# Show User Environment Variables
function Show-UserEnv {
    try {
        $userEnv = [Environment]::GetEnvironmentVariables("User")
        Write-Host "User Environment Variables:"
        foreach ($variable in $userEnv.GetEnumerator()) {
            $name = $variable.Key
            $value = $variable.Value
            Write-Host "$name = $value"
        }
        Write-Host
    }
    catch {
        Write-Host "Failed to retrieve User Environment Variables: $_"
    }
}

# Show all environment variables
function Show-Env {
    try {
        Show-ProcessEnv
        Show-MachineEnv
        Show-UserEnv
    }
    catch {
        Write-Host "Failed to retrieve environment variables: $_"
    }
}

# Call the Show-Env function
Show-Env
