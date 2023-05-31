
param (
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$secureString = ConvertTo-SecureString -String "YourEncryptionPassword" -Force -AsPlainText
$encryptedFile = "$Path.enc"

if (Test-Path $encryptedFile) {
    Write-Host "The encrypted file already exists: $encryptedFile"
    exit
}

try {
    if (Test-Path $Path -or (Get-Item -Path $Path).PSIsContainer) {
        Write-Host "Encrypting $Path..."
        $Path | ConvertTo-SecureString -Key $secureString | ConvertFrom-SecureString | Set-Content $encryptedFile
        Write-Host "Encryption completed successfully!"
    } else {
        Write-Host "The specified path is not a file or directory: $Path"
    }
}
catch {
    Write-Host "An error occurred during encryption: $_"
}
