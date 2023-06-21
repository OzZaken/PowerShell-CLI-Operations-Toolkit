# Get-ChildItem -Path "D:\FullStack\CourseJuly\CaJul22-Materials\" -Recurse | Select-String -Pattern "cash" -List | Select Path

# shorted
# gci -r | sls -pattern Read-Host "Enter String to find" | group path | select name

try {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Pattern
    )

    Get-ChildItem -Path $Path -Recurse | Select-String -Pattern $Pattern -List | Select-Object Path
}
catch {
    Write-Host "An error occurred: $_"
}
