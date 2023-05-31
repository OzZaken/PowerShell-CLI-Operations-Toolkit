## Maintenance
| Description                                                                    | **Maintenance**                                                                        |
| ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| check volumes /perf: maxSpeed  /F:Fix Error  /r: recover readable information. | `chkdsk`                                                                               |
| rapir system files.                                                            | `DISM /online /cleanup-image /restoreHealth`                                           |
| Update All Program on your computer                                            | `winget upgrade` + `winget upgrade --all`                                              |
| Microsoft Windows Malicious Software Removal Tool.                             | `mrt`                                                                                  |
| rapir system files.                                                            | `sfc /scannow`                                                                         |
| Show Connection Name Network Adapter Physical Address Transport Name           | `getmac /v`                                                                            |
| Schedules the computer to shut down                                            | `shutdown -s`                                                                          |
| force and restart at advenced  startup options                                 | `shutdown /f /r / o`                                                                   |
| restart WS                                                                     | `shutdown -r -f -t 0`                                                                  |
| Restart the computer and enter Bios.                                           | `shutdown /r /fw /f /t 0`                                                              |
| Displays the ARP cache, which contains recently looked up addresses.           | `arp -a`                                                                               |
| edit the system time                                                           | `time`                                                                                 |
| setting time synchronisation/time server/time zone                             | `w32tm`                                                                                |
| start a program as another user                                                | `runas`                                                                                |
| Check the temperature of the CPU.                                              | `wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature` |
| Remove "Active Windows" desktop wotermark                                      | `bcdedit -set TESTSIGNING OFF`                                                         |
| Remove Directory /s: all subFolder and files /q: "quiet" mode                  | `rd /s /q [File PATH]`                                                                 |
| Remove Directory and all subFolder and files Fast.                             | `rimraf [File PATH]`                                                                   |

1. [+] DISM:
   DISM (Deployment Image Servicing and Management) is a command-line tool used for servicing and managing Windows images. It allows you to perform various operations on Windows images, such as adding or removing drivers, enabling or disabling features, and more.

2. Get ComputerName.ps1:
   This script retrieves the computer name of the current system. It provides a way to programmatically access and display the computer name for identification or troubleshooting purposes.

3. Get EnvVars.ps1:
   This script retrieves the environment variables defined on a Windows system. It displays information about variables such as the system path, user-specific variables, and other environment-related settings.

4. Get PowerStatus.ps1:
   This script retrieves the power status of a Windows system. It provides information about the current power source (AC or battery), battery percentage, remaining time, and other power-related details.

5. Get SystemDetails.ps1:
   This script retrieves various system details and information about a Windows system. It includes details such as the operating system version, processor information, memory, disk space, and other hardware and software-related information.

6. Get SystemIcons.ps1:
   This script retrieves system icons associated with various file types or system resources on a Windows system. It allows you to access and display system icons programmatically for use in applications or scripts.

7. getmac.ps1:
   The getmac command is used to retrieve the MAC (Media Access Control) addresses of network interfaces on a Windows system. It provides a way to view the hardware addresses associated with network adapters.

8. hostname.ps1:
   This script retrieves the hostname of a Windows system. It provides a way to programmatically access and display the hostname for identification or network-related purposes.

9. NotificationMsg.ps1:
   This script displays a notification message or toast notification on a Windows system. It can be used to show informative or alert messages to the user.

10. NotificationMsgAsync.ps1:
    This script displays a notification message or toast notification asynchronously on a Windows system. It allows the script to continue executing while the notification is being displayed.

11. PopUpMsg.ps1:
    This script displays a pop-up message box on a Windows system. It can be used to show important messages or prompts that require user interaction.

12. Read System.ps1:
    This script reads system information from a file or input source. It likely contains code to parse and extract relevant system details from the provided input.

13. Report SystemProcess.ps1:
    This script generates a report containing information about system processes on a Windows system. It includes details such as process names, PIDs, memory usage, CPU usage, and more.

14. Speak.ps1:
    This script uses text-to-speech functionality to speak a specified message on a Windows system. It can be used to provide audible feedback or alerts to the user.

15. systeminfo.ps1:
    The systeminfo command displays detailed information about the hardware and software components of a Windows system. It provides an overview of the system's configuration, including the operating system version, processor, memory, and more.

16. Write Event.ps1:
    This script writes an event log entry to the Windows Event Log. It allows you to log custom events with specified information for monitoring, troubleshooting, or auditing purposes.
