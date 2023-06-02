# Create a self-signed certificate using Powershell
New-SelfSignedCertificate -DnsName julian@techexpert.tips -CertStoreLocation Cert:\CurrentUser\My\ -FriendlyName "MyCert" -NotAfter (Get-Date).AddYears(10) -KeyLength 4096 -Type Codesigning

# List the certificates in the current user's personal store.
Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert
# Output:
# Thumbprint                                Subject
# ----------                                -------
# C9D463CDA04D7583221FE14C32D7B7570537905A  CN=julian@techexpert.tips

# Export the public key of the certificate.
Export-Certificate -Cert Cert:\CurrentUser\My\C9D463CDA04D7583221FE14C32D7B7570537905A -FilePath C:\MyPublicCert.cer

# Import this certificate as a trusted root certification authority.
Import-Certificate -CertStoreLocation Cert:\LocalMachine\AuthRoot -FilePath C:\MyPublicCert.cer

# Import this certificate as a trusted publisher.
Import-Certificate -CertStoreLocation Cert:\LocalMachine\TrustedPublisher -FilePath C:\MyPublicCert.cer

# Create a Powershell script.
New-Item 'C:\test.ps1' -type file
ise C:\test.ps1

# Digitally sign the Powershell script.
Set-AuthenticodeSignature -FilePath C:\test.ps1 -Certificate (Get-ChildItem -Path Cert:\CurrentUser\My\C9D463CDA04D7583221FE14C32D7B7570537905A)
# Output:
# SignerCertificate                         Status                                 Path
# -----------------                         ------                                 ----
# C9D463CDA04D7583221FE14C32D7B7570537905A  Valid                                  test.ps1


# There are multiple ways to digitally sign the Powershell script.
Set-AuthenticodeSignature -FilePath C:\test.ps1 -Certificate (Get-ChildItem -Path Cert:\CurrentUser\My\ -CodeSigningCert)

# Congratulations! You are able to create digitally signed Powershell Scripts.
#  Testing digitally signed Scripts

# Change the Powershell execution policy to allow only signed scripts.
Set-ExecutionPolicy AllSigned

# Execute our digitally signed Powershell script.
C:\test.ps1


# Execute a Powershell script not digitally signed.
# C:\test2.ps1 : File C:\test2.ps1 cannot be loaded. The file C:\test2.ps1 is not digitally signed. You cannot run this
# script on the current system. For more information about running scripts and setting execution policy, see
# about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
# At line:1 char:1
# + C:\test2.ps1
# + ~~~~~~~~~~~~
#     + CategoryInfo          : SecurityError: (:) [], PSSecurityException
#     + FullyQualifiedErrorId : UnauthorizedAccess
