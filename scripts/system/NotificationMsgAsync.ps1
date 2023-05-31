param (
    [ValidateSet('Application', 'Asterisk', 'Error', 'Exclamation', 'Hand', 'Information', 'Question', 'Shield', 'Warning')]
    [string]$Icon = 'Information',

    [Parameter(Mandatory=$true)]
    [string]$Title,

    [Parameter(Mandatory=$true)]
    [string]$Message
)
try {
    # Load required assemblies
    [reflection.assembly]::loadwithpartialname('System.Windows.Forms')
    [reflection.assembly]::loadwithpartialname('System.Drawing')

    # Create NotifyIcon object
    $notify = new-object system.windows.forms.notifyicon

    $notify.Icon = [System.Drawing.SystemIcons]::$Icon

    # Make the NotifyIcon visible
    $notify.Visible = $true

    # Show the balloon tip
    $notify.ShowBalloonTip(10, $Title, $Message, [System.Windows.Forms.ToolTipIcon]::None)
}
catch {
    Write-Error "An error occurred: $_"
}
finally {
    # Clean up resources
    if ($notify) {
        $notify.Dispose()
    }
}