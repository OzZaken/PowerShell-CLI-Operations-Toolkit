## netsh
| Description                                        | Command                                                                                                        |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Find Wifi interfaces                               | `netsh interface show address \| findstr "IP_ADDRESS"`                                                         |
| Displaying Wifi interfaces                         | `netsh interface show interface`                                                                               |
| Get wireless report                                | `netsh wlan show wlanreport`                                                                                   |
| Deleting a route                                   | `netsh interface ip delete route 192.168.1.0/24 "Local Area Connection"`                                       |
| Displaying the current IP configuration            | `netsh interface ip show config`                                                                               |
| Setting a static IP address                        | `netsh interface ip set address "Local Area Connection" static IP_ADDRESS SUBNET_MASK GATEWAY`                 |
| Configuring a DHCP IP address                      | `netsh interface ip set address "Local Area Connection" dhcp`                                                  |
| Adding a DNS server                                | `netsh interface ip add dns "Local Area Connection" DNS_SERVER_IP_ADDRESS`                                     |
| Enabling or disabling a firewall rule              | `netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes`                          |
| Displaying all firewall rules                      | `netsh advfirewall firewall show rule name=all`                                                                |
| Turning off all firewall rules                     | `netsh advfirewall firewall set allprofiles state off`                                                         |
| Turning on all firewall rules                      | `netsh advfirewall firewall set allprofiles state on`                                                          |
| Configuring a wireless network                     | `netsh wlan set profileparameter name="NetworkName" connectiontype=ESS`                                        |
| Enabling or disabling a wireless interface         | `netsh interface set interface "Wireless Network Connection" admin=enable`                                     |
| Flushing the DNS cache                             | `netsh interface ip delete dnscache`                                                                           |
| Exporting and importing network configuration      | `netsh -c interface dump > network.txt`                                                                        |
| Adding a new firewall rule                         | `netsh advfirewall firewall add rule name="RuleName" dir=in action=allow protocol=TCP localport=80`            |
| Adding a new firewall rule for remote IP address   | `netsh advfirewall firewall add rule name="RuleName" dir=in action=allow protocol=TCP remoteip=192.168.1.0/24` |
| Disabling firewall for Domain profile              | `netsh advfirewall set domainprofile state off`                                                                |
| Disabling firewall for Private profile             | `netsh advfirewall set privateprofile state off`                                                               |
| Disabling firewall for Public profile              | `netsh advfirewall set publicprofile state off`                                                                |
| Adding a new IP address to the specified interface | `netsh interface ip add address "Local Area Connection" 192.168.1.100 255.255.255.0`                           |
| Removing a IP address from the specified interface | `netsh interface ip delete address "Local Area Connection" 192.168.1.100`                                      |
| Renewing DHCP lease                                | `netsh interface ip renew "Local Area Connection"`                                                             |
| Adding a new route                                 | `netsh interface ip add route 192.168.1`                                                                       |
| Get wireless report                                | `netsh wlan show wlanreport`                                                                                   |