## netstat
| Description                                                                                                               | **netstat**         |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| Displays network connection information and statistics.                                                                   |                     |
| Displays active TCP connections and the process ID (PID) associated with each connection.                                 | `netstat`           |
| Display all ports open.                                                                                                   | `netstat -an`       |
| Displays active TCP connections and the process ID (PID) associated with each connection, as well as all listening ports. | `netstat -af`       |
| Shows the process ID (PID) and name associated with each active connection.                                               | `netstat -o`        |
| Displays Ethernet statistics and updates every 5 seconds.                                                                 | `netstat -e -t 5`   |
| Shows the status of NetBIOS over TCP/IP connections for a specific IP address.                                            | `nbtstat -a [IP]`   |
| Shows active TCP connections and their information in numerical form.                                                     | `netstat -n -p tcp` |
| Shows statistics for the TCP/IP protocol.                                                                                 | `netstat -s`        |
| Display active TCP connections associate with Folder or File.                                                             | `netstat -ano       | findstr /R "[PATH]` |