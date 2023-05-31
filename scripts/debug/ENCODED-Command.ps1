$MYCOMAND = "dir c:\"
$ENCODED = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($MYCOMMAND))
Write-Output $ENCODED
# ZABpAHIAIABjADoAXAA=

powershell -E ZABpAHIAIABjADoAXAA=

$MYCOMMAND = $ENCODED
$DECODED = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($MYCOMMAND))
Write-Output $DECODED