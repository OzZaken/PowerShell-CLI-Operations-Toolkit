# ipconfig Command

The `ipconfig` command is a Windows command-line utility that displays the current configuration of IP addresses on a local network interface. It provides valuable information about network settings, including IP addresses, subnet masks, default gateways, and more. This command is useful for troubleshooting network connectivity issues and gathering network information.

## Syntax
ipconfig [/all] [/renew] [/release] [/flushdns] [/displaydns] [/registerdns] [/showclassid <Adapter>] [/setclassid <Adapter> [ClassID]]


## ipconfig
| Description                                            | Commands               |
| ------------------------------------------------------ | ---------------------- |
| Displays network configuration information.            | `ipconfig`             |
| Displays the IP configuration of all network adapters. | `ipconfig /all`        |
| Displays DNS information.                              | `ipconfig              | findStr DNS` |
| Releases the current IP configuration.                 | `ipconfig /release`    |
| Obtains a new IP configuration.                        | `ipconfig /renew`      |
| Displays the contents of the DNS cache.                | `ipconfig /displaydns` |
| Copies the output of displaydns command to clipboard.  | `ipconfig /displaydns  | clip`        |
| Clears the DNS cache.                                  | `ipconfig /flushdns`   |


## Example Output
Running the ipconfig command without any options produces output similar to the following:

```bash
Windows IP Configuration

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix . :
   IPv4 Address. . . . . . . . . . . : 192.168.1.101
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.1.1

Wireless LAN adapter Wi-Fi:

   Connection-specific DNS Suffix . : example.com
   IPv4 Address. . . . . . . . . . . : 192.168.1.102
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.1.1

Tunnel adapter Teredo Tunneling Pseudo-Interface:

   Connection-specific DNS Suffix . :
   IPv6 Address. . . . . . . . . . . : 2001:0db8:85a3:0000:0000:8a2e:0370:7334
   Default Gateway . . . . . . . . . : ::
```