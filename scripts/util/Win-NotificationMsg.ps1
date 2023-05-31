param (
    [ValidateSet('Application', 'Asterisk', 'Error', 'Exclamation', 'Hand', 'Information', 'Question', 'Shield', 'Warning')]
    [string]$Icon = 'Information',

    [Parameter(Mandatory = $true)]
    [string]$Title,

    [Parameter(Mandatory = $true)]
    [string]$Message
)

[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')

$notify = new-object system.windows.forms.notifyicon

$notify.icon = [System.Drawing.SystemIcons]::$Icon

$notify.visible = $true

$notify.showballoontip(10, $Title, $Message, [system.windows.forms.tooltipicon]::None)