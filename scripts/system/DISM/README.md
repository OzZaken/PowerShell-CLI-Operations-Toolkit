# DISM Command
The DISM (Deployment Image Servicing and Management) command is a Windows command-line tool used for servicing and managing Windows images, including offline images (WIM, VHD, or VHDX files) and online images (running Windows installations). It provides various functions for image management, such as adding or removing components, updating drivers, and applying updates. This command is particularly useful for system administrators and IT professionals working with Windows deployments.

## Syntax
```bash
DISM.exe /<command> [options]
```

## Usage
| Command                  | Description                                                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `/CheckHealth`           | Checks the health of the Windows image without performing any repairs.                                                                      |
| `/ScanHealth`            | Scans the Windows image for component store corruption but doesn't perform any repairs.                                                     |
| `/RestoreHealth`         | Performs an advanced scan on the Windows image, downloads necessary files, and repairs any detected component store corruption.             |
| `/Online`                | Specifies that the operation should be performed on the running operating system rather than an offline image.                              |
| `/Cleanup-Image`         | Performs a cleanup operation on the Windows image to reduce the size of the component store.                                                |
| `/StartComponentCleanup` | Performs a cleanup operation on the Windows image to reduce the size of the WinSxS folder.                                                  |
| `/RestoreHealth`         | Initiates a repair process by attempting to restore the health of the Windows image, including repairing corrupted or missing system files. |
| `/Get-WIMInfo`           | Retrieves information about a Windows image file (.wim) or a virtual hard disk (.vhd/.vhdx).                                                |
| `/Mount-WIM`             | Mounts a Windows image for servicing or inspection.                                                                                         |
| `/Unmount-WIM`           | Unmounts a previously mounted Windows image.                                                                                                |
| `/Add-Package`           | Adds a package (.cab or .msu) to the Windows image.                                                                                         |
| `/Remove-Package`        | Removes a package from the Windows image.                                                                                                   |
| `/Enable-Feature`        | Enables a Windows feature in the Windows image.                                                                                             |
| `/Disable-Feature`       | Disables a Windows feature in the Windows image.                                                                                            |
| `/Get-Features`          | Retrieves a list of enabled or disabled features in the Windows image.                                                                      |