param (
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$secureString = ConvertTo-SecureString -String "YourEncryptionPassword" -Force -AsPlainText
$decryptedFile = "$Path.dec"

if (Test-Path $decryptedFile) {
    Write-Host "The decrypted file already exists: $decryptedFile"
    exit
}

try {
    if (Test-Path $Path -or (Get-Item -Path $Path).PSIsContainer) {
        Write-Host "Decrypting $Path..."
        $Path | Get-Content | ConvertTo-SecureString | ConvertFrom-SecureString -Key $secureString | Set-Content $decryptedFile
        Write-Host "Decryption completed successfully!"
    } else {
        Write-Host "The specified path is not a file or directory: $Path"
    }
}
catch {
    Write-Host "An error occurred during decryption: $_"
}
