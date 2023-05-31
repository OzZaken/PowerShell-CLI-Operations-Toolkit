param (
    [Parameter(Mandatory = $true)]
    [string]$Title,

    [Parameter(Mandatory = $true)]
    [string]$Message
)

try {
    # Load required assembly
    [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null

    # Show the message box
    [System.Windows.Forms.MessageBox]::Show($Message, $Title)
}
catch {
    Write-Error "An error occurred: $_"
}
