# Ignore SSL Warning
[Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
try {

# Create Web Http request to URI
$uri = "https://google.com/" 
$webRequest = [Net.HttpWebRequest]::Create($uri)
# Get URL Information
$webRequest.ServicePoint
# Retrieve the Information for URI
$webRequest.GetResponse() | Out-NULL
# Get SSL Certificate information
$webRequest.ServicePoint.Certificate
}
catch {
    Write-Host "An error occurred: $($_)"
    if ($_.Exception.InnerException) {
        Write-Host "Inner exception: $($_.Exception.InnerException.Message)"
    }
}
