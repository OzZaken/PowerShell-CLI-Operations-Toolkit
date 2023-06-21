# Like use strict (in Js)=  "Stop", "Continue", "Inquire", or "SilentlyContinue". 
$ErrorActionPreference = "Stop"  

# services
$WriteLog = Join-Path -Path $PSScriptRoot -ChildPath "services\Write-Log.ps1"
$ReadEnvVar = Join-Path -Path $PSScriptRoot -ChildPath "services\Read-EnvVar.ps1"
$GetUser = Join-Path -Path $PSScriptRoot -ChildPath "services\Get-User.ps1"
$SetEnvVar = Join-Path -Path $PSScriptRoot -ChildPath "services\Set-EnvVar.ps1"
$GetEnvVar = Join-Path -Path $PSScriptRoot -ChildPath "services\Get-EnvVar.ps1"
$WriteCenter = Join-Path -Path $PSScriptRoot -ChildPath "services\Write-Center.ps1"

# globals
$global:firstInit = 0
$global:currentUser = ""

function init {
    # Initilaize globals
    if ($global:firstInit -eq 0) {
        $global:firstInit = 1
        Clear-Host 

        # Show Enviorment
        Invoke-Expression "$ReadEnvVar"

        try {
            # Get the scripts folders in the specified path
            $scriptsDir = Join-Path -Path $PSScriptRoot -ChildPath "scripts"
            $scriptsDirs = Get-ChildItem -Path $scriptsDir -Directory
            
            # Get Valid Username
            $global:currentUser = Invoke-Expression $GetUser
            
            # Set Enviorment Variable with logs
            Invoke-Expression "$SetEnvVar -Name 'PowerDesk_CURRENT_USER' -Val '$currentUser' -Scope 'Process'"
            Invoke-Expression "$WriteLog -Message 'init' -FileName 'index' -Severity 'Info'"
        }
        catch {
            Invoke-Expression "$WriteLog -Message 'init $($_.Exception.Message)' -FileName 'index' -Severity 'Error'"
        }
    }
    Clear-Host  # Clear the console each start
    $isContributer = Invoke-Expression "$GetEnvVar -Name 'isContributor'"

    # Show header “dddd MM/dd/yyyy HH:mm K”
    Invoke-Expression "$WriteCenter -Txt 'Powershell operation toolkit - Seasion $(Get-Date -Format "MM/dd/yyyy") - current user: $currentUser`n'"
    Write-Host "[0] Exit Toolkit or Choose relevent folder:`n" -ForegroundColor Yellow

    # Show scripts directories
    for ($i = 0; $i -lt $scriptsDirs.Count; $i++) {
        Write-Host "$($i + 1). $($scriptsDirs[$i].Name)"
    }
    Write-Host 

    # Prompt for the user's selectDirIdx and Convert to integer
    $selectDirIdx = Read-Host "Select scripts directory index (0..$($scriptsDirs.Count))" 
    $selectDirIdx = [int]$selectDirIdx 
    
    # Process user's selectDirIdx
    if ($selectDirIdx -eq 0) {
        break
    }
    elseif ($selectDirIdx -ge 1 -and $selectDirIdx -le $scriptsDirs.Count) {
        $dirpath = Get-NameFromPath -Path $($scriptsDirs[$selectDirIdx - 1].FullName)
        $dirName = $(Split-Path -Leaf $dirpath)
        # Invoke-Expression "$WriteLog -Message 'selected script dir: $dirName' -FileName 'index'"
        # Enter debug allow to contributors\admin only
        if (($dirName -eq "debug") -and ($isContributer -ne "True") ) {
            Write-Host "`ndebug use for CRUD new scripts, [contributers users] read contributing.md file doe more details"
            Show-Menu
        }
        $selectedFolder = $scriptsDirs[$selectDirIdx - 1].FullName
        Show-SubMenu -Subfolder $selectedFolder
    }
    else {
        Write-Host "Invalid scripts directory Idx: $selectDirIdx"
        Show-Menu
    }
}

# Back to init
function Show-Menu {
    # Prompt the user to press Enter to return to the menu
    Write-Host "Press Enter to back to the menu Toolkit...`n"
    Read-Host | Out-Null
    # Return to the main menu
    init
}

# Choose script to Invoke
function Show-SubMenu {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Subfolder
    )
    Clear-Host # Clear the console screen
    
    $dirName = Get-NameFromPath -Path $Subfolder
    if ($dirName -eq "debug" ) {
        $isContributer = Invoke-Expression "$GetEnvVar -Name 'isContributor'"
        if ($isContributer -ne "True") {
            init
        }
    }
    # Show Header
    Invoke-Expression "$WriteCenter -Txt 'Powershell operation toolkit Toolkit\$dirName'"
     
    # Check if README.md file exists in the selected subfolder
    $readmeFilePath = Join-Path -Path $Subfolder -ChildPath "README.md"
    if (Test-Path -Path $readmeFilePath) {
        # Display README content
        try {
            $readmeContent = Get-Content $readmeFilePath -Raw
            Write-Host "README Content:`n" -BackgroundColor DarkMagenta -ForegroundColor DarkYellow
            Write-Host $readmeContent  -BackgroundColor DarkGray -ForegroundColor White
            Write-Host
        }
        catch {
            Write-Host "An error occurred while reading the README.md file."
            Write-Host "Error: $_"
            Write-Host
        }
    }

    # Get all folders and script files within the selected subfolder
    $scripts = Get-ChildItem -Path $Subfolder | Where-Object { $_.Extension -eq ".ps1" -or $_.PSIsContainer }

    # Show Go back option
    Write-Host "0. to Go back`n" -ForegroundColor Yellow

    # Show the subfolders and script files
    for ($i = 0; $i -lt $scripts.Count; $i++) {
        $displayName = $scripts[$i].Name -replace "_", " " -replace "-", " "
        if ($scripts[$i].PSIsContainer) {
            Write-Host "$($i + 1). [+] $displayName" # Display subfolders
        }
        else {
            Write-Host "$($i + 1). $displayName" # Display scripts
        }
    }

    # Prompt for the user's selection and Convert to integer
    $selection = Read-Host "`nSelect script or return to menu ([0]..$($scripts.Count))"
    $selection = [int]$selection  

    # Process user's selection
    if ($selection -eq 0) {
        init
    }
    elseif ($selection -ge 1 -and $selection -le $scripts.Count) {
        $selectedItem = $scripts[$selection - 1]
        
        if ($selectedItem.PSIsContainer) {
            # User selected a subfolder
            Show-SubMenu -Subfolder $selectedItem.FullName
        }
        else {
            # User selected a script file
            $selectedFile = $selectedItem.FullName
            Write-Host "Invoke-Script. $selection. $selectedFile`n" -ForegroundColor Green
            try {
                Invoke-Script -ScriptPath $selectedFile
            }
            catch {
                Invoke-Expression  "$WriteLog -Message 'Invoke-Script' -File (Get-Date -Format 'yyyy-MM-dd') -Severity Error"
                Invoke-Expression  "$WriteLog -Message '[$selection], max idx [$($scripts.Count)], selectedFile: [$selectedFile]`n$_' -File $selectedFile -Severity Error"
            }
        }
    }
    else {
        Write-Host "Invalid selection: $selection`n" -ForegroundColor Red
        Show-Menu
    }
}

# Show script content before invoke
function Show-ScriptContent {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ -PathType 'Leaf' })]
        [String]$Path
    )
    Clear-Host # Clear the console screen

    try {
        # Read the content of the selected script file
        $scriptContent = Get-Content -Path $Path -Raw

        # Show the script content and parameter definitions
        Write-Host "Script Content:`n" -ForegroundColor Yellow
        Write-Host $scriptContent -ForegroundColor Gray
        
        Write-Host 
    }
    catch {
        
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

# Invoke Script With logs
function Invoke-Script {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ScriptPath
    )

    # Show script name for the User. 
    $pattern = '\\([^\\]+)\.[^\.]+$'
    $name = [regex]::Match($ScriptPath, $pattern).Groups[1].Value

    Show-ScriptContent -Path $ScriptPath
    
    # Prompt for additional parameters or the option to go back
    Write-Host "`nEnter to Invoke, add additional parameters (if any), or [0] to go back"    
    $additionalParams = Read-Host "Enter to Invoke with parametes (if any) or 0 for return"

    # Check if the user chose to go back
    if ($additionalParams -eq "0") {
        Show-SubMenu -Subfolder (Split-Path $ScriptPath -Parent)
        return
    }

    # Build the command to execute
    $command = "$ScriptPath $additionalParams"

    try {
        # Invoke the command in the selected script file
        Invoke-Expression $command

        Invoke-Expression "$WriteLog -Message 'Invoke-Expression: [$name]' -FileName '$name' -Severity 'Info'"
        Show-Menu
    }
    catch {
        # Two types of logs, 1.for each file 2.for each day use
        Invoke-Expression "$WriteLog -Message 'Invoke-Expression: [$name]' -FileName '$name' -Severity 'Error'"

        # on prodaction back to parant directory
        # Show-SubMenu -Subfolder (Split-Path $ScriptPath -Parent)
        Show-Menu
    }
}
function Get-NameFromPath {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    return Split-Path -Leaf $Path
}

init

# Clean Up
try {
    Invoke-Expression "$WriteLog -Message 'cleanup' -FileName 'index' "
    $env:PowerDesk_CURRENT_USER = ""
    $env:isContributer = "False"
}
catch {
    Invoke-Expression "$WriteLog -Message 'An error occurred during cleanup: $_' -FileName 'index' -Severity 'Error'"
}