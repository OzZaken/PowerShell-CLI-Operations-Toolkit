function Convert-SubnetToBinary {
    param (
        [Parameter(Mandatory=$true)]
        [string]$subnetMask
    )

    try {
        # Splitting the subnet mask into octets
        $octets = $subnetMask.Split('.')

        # Checking if the subnet mask is valid
        if ($octets.Count -ne 4) {
            throw "Invalid subnet mask"
        }

        # Converting each octet to binary
        $binaryOctets = @()
        foreach ($octet in $octets) {
            $binaryOctet = [convert]::ToString([int]$octet, 2).PadLeft(8, '0')
            $binaryOctets += $binaryOctet
        }

        # Joining the binary octets with periods
        $binarySubnet = $binaryOctets -join '.'

        return $binarySubnet
    }
    catch {
        Write-Error "Error: $_"
    }
}

# Testing the function
$subnetMask = Read-Host "Enter the subnet mask"
Convert-SubnetToBinary -subnetMask $subnetMask
