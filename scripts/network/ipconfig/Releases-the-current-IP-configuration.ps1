$command = "ipconfig /release"

try {
    $output = Invoke-Expression -Command $command 

    # Display the command output
    $output
}
catch {
    # Handle the exception
    $errorMessage = $_.Exception.Message
    Write-Error "`nAn error occurred while executing the command:`n$errorMessage" 
}