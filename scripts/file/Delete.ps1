param (
    [Parameter(Mandatory = $true)]
    [string]$Path
)

Write-Host "Delete a file 'C:\test.txt'" -ForegroundColor Cyan
Write-Host "Delete multiple files 'C:\files\fileA.txt','C:\files\fileB.txt','C:\files\fileC.txt'" -ForegroundColor Cyan
Write-Host "Delete all files inside a folder. 'C:\files\*.*'" -ForegroundColor Cyan
Write-Host "Delete all files with the same extension. 'C:\files\*.txt'" -ForegroundColor Cyan
Write-Host "Delete a folder 'C:\Folder'" -ForegroundColor Cyan
Write-Host "Delete a folder and all its content -Recurse" -ForegroundColor Cyan

try {
    Remove-Item -Path $Path
    Write-Host "Delete $path secesseful" -ForegroundColor Magenta

}
catch {
    Write-Error "Faild delete $path"
}