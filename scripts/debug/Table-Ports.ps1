$ports = @(
    @{
        Port = 80
        Protocol = 'HTTP'
        Description = 'Hypertext Transfer Protocol'
    },
    @{
        Port = 443
        Protocol = 'HTTPS'
        Description = 'Hypertext Transfer Protocol Secure'
    },
    @{
        Port = 22
        Protocol = 'SSH'
        Description = 'Secure Shell'
    },
    @{
        Port = 25
        Protocol = 'SMTP'
        Description = 'Simple Mail Transfer Protocol'
    },
    @{
        Port = 53
        Protocol = 'DNS'
        Description = 'Domain Name System'
    },
    @{
        Port = 21
        Protocol = 'FTP'
        Description = 'File Transfer Protocol'
    },
    @{
        Port = 110
        Protocol = 'POP3'
        Description = 'Post Office Protocol version 3'
    },
    @{
        Port = 143
        Protocol = 'IMAP'
        Description = 'Internet Message Access Protocol'
    },
    @{
        Port = 3389
        Protocol = 'RDP'
        Description = 'Remote Desktop Protocol'
    },
    @{
        Port = 445
        Protocol = 'SMB'
        Description = 'Server Message Block'
    },
    @{
        Port = '137-139'
        Protocol = 'NetBIOS'
        Description = 'Windows file sharing and networking services'
    },
    @{
        Port = 1194
        Protocol = 'OpenVPN'
        Description = 'Open Virtual Private Network'
    },
    @{
        Port = 3306
        Protocol = 'MySQL'
        Description = 'MySQL Database System'
    },
    @{
        Port = 5432
        Protocol = 'PostgreSQL'
        Description = 'PostgreSQL Database System'
    },
    @{
        Port = 8080
        Protocol = 'HTTP (Alt)'
        Description = 'Alternative HTTP port'
    }
)

$ports | ForEach-Object {
    $_ | Select-Object -Property @{Name='Port';Expression={$_.Port}}, @{Name='Protocol';Expression={$_.Protocol}}, @{Name='Description';Expression={$_.Description}}
}
