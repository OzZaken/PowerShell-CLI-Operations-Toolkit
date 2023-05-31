function Convert-BinaryToSubnet {
    param (
        [Parameter(Mandatory=$true)]
        [string]$binarySubnet
    )

    try {
        # Splitting the binary subnet mask into octets
        $binaryOctets = $binarySubnet.Split('.')

        # Checking if the binary subnet mask is valid
        if ($binaryOctets.Count -ne 4) {
            throw "Invalid binary subnet mask"
        }

        # Converting each binary octet to decimal
        $decimalOctets = @()
        foreach ($binaryOctet in $binaryOctets) {
            $decimalOctet = [convert]::ToInt32($binaryOctet, 2)
            $decimalOctets += $decimalOctet
        }

        # Joining the decimal octets with periods
        $subnetMask = $decimalOctets -join '.'

        return $subnetMask
    }
    catch {
        Write-Error "Error: $_"
    }
}

# Testing the function
$binarySubnet = Read-Host "Enter the binary subnet mask"
Convert-BinaryToSubnet -binarySubnet $binarySubnet
