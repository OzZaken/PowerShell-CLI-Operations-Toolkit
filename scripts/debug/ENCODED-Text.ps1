$MYTEXT = 'This is my secret text'
$ENCODED = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($MYTEXT))
Write-Output $ENCODED

$MYTEXT = $ENCODED
$DECODED = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($MYTEXT))
Write-Output $DECODED