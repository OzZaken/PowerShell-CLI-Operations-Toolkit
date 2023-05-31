# ? becuase Of nasted folders, is it better saved on one variable for better code or better that way to better read?
$networkDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$scriptsDir = Split-Path -Parent -Path $networkDir
$rootDir = Split-Path -Parent -Path $scriptsDir
$configDir = Join-Path -Path $rootDir -ChildPath 'config'

$hostsFile = Join-Path -Path $configDir -ChildPath 'HOSTS.txt'
$portsFile = Join-Path -Path $configDir -ChildPath 'PORTS.txt'

try {
    $hosts = Get-Content $hostsFile
    $ports = Get-Content $portsFile

    $table = @()

    # Populate the table with hostnames and ports
    foreach ($hostname in $hosts) {
        $row = New-Object -TypeName PSObject
        $row | Add-Member -MemberType NoteProperty -Name 'Hostname' -Value $hostname

        foreach ($port in $ports) {
            $row | Add-Member -MemberType NoteProperty -Name $port -Value $null
        }

        $table += $row
    }

    # Attempt to connect to each host and port combination
    foreach ($row in $table) {
        foreach ($port in $ports) {
            try {
                $client = New-Object System.Net.Sockets.TcpClient
                $status = $client.ConnectAsync($row.Hostname, $port).Wait(1000)
                $client.Close()
                $row.$port = $status
            }
            catch {
                $row.$port = $false
            }
        }
    }

    # Output the table
    $table | Format-Table -AutoSize
}
catch {
    Write-Output "An error occurred: $_"
}