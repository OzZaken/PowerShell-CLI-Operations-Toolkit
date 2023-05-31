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