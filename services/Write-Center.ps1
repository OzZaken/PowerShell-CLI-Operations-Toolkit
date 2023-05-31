param (
    [string]$Txt,
    [string]$Color = "Green"
)

try {
    $consoleWidth = $Host.UI.RawUI.WindowSize.Width
    $padding = [Math]::Max(0, ($consoleWidth - $Txt.Length) / 2)
    $centeredMessage = $Txt.PadLeft($padding + $Txt.Length)

    Write-Host $centeredMessage -ForegroundColor $Color
} 
catch {
    Write-Host "An error occurred: $_" -ForegroundColor "Red"
}
