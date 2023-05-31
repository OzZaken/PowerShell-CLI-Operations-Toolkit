param(
    [Parameter(Mandatory = $true)]
    [int]$Length
)
# ASCII Character set of password
$CharacterSet = @{
    Uppercase   = (97..122) | Get-Random -count 10 | % { [char]$_ }
    Lowercase   = (65..90) | Get-Random -count 10 | % { [char]$_ }
    Numeric     = (48..57) | Get-Random -count 10 | % { [char]$_ }
    specialChar = (33..47) + (58..64) + (91..96) + (123..126) | Get-Random -count 10 | % { [char]$_ }
}

$StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + $CharacterSet.Numeric + $CharacterSet.specialChar 

-join (Get-Random -Count $Length -InputObject $StringSet )