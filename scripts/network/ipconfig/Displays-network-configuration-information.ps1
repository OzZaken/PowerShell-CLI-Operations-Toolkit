$WriteLog = Join-Path -Path (Split-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -Parent) '.\services\logger.ps1'

try {
    # Get the script filename without extension
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Path)

    # Display the command output
    $output = ipconfig /all

    # Log
    if ($WriteLog -and (Test-Path $WriteLog)) {
        . $WriteLog -Msg $output -FileName $fileName -Severity 'Info'
    }

    # Run the ipconfig command
    Write-Output $output
}
catch {
    # Handle the exception
    $Msg = $_.Exception.Message
    $Msg = "An error occurred while executing the command: $_"
    Write-Error "`nAn error occurred while executing the command:`n$Msg" 
    
    if ($WriteLog -and (Test-Path $WriteLog)) {
        . $WriteLog -Msg $Msg -FileName $fileName -Severity 'Error'
    }
    else {
        Write-Host "An error occurred while executing the command: $_"
    }
}
