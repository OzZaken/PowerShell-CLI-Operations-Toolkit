param(
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [string]$Description = "",

    [Parameter(Mandatory=$true)]
    [SecureString]$SecurePassword,

    [string]$Group = "Users"
)

try {
    New-LocalUser -Name $Name -Description $Description -Password $SecurePassword
    Write-Host "User $Name created successfully."
} catch {
    Write-Host "Error creating user: $_"
}

Write-Host "Local users:"
Get-LocalUser

try {
    Add-LocalGroupMember -Group $Group -Member $Name
    Write-Host "User $Name added to the group $Group successfully."
} catch {
    Write-Host "Error adding user $Name to group $Group : $_"
}

Write-Host "Group members:"
Get-LocalGroupMember -Group $Group

# $SecurePassword = ConvertTo-SecureString -AsPlainText -Force -String "kamisama123@@"
# .\Upgrade-Script.ps1 -Name "gohan" -Description "Son of Goku" -SecurePassword $SecurePassword -Group "Administrators"