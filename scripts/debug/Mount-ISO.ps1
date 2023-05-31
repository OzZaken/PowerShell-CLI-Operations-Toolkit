# Mount an ISO file using Powershell.
Mount-DiskImage -ImagePath "C:\ubuntu.iso"

# List the volumes available.
Get-Volume

# Unmount the ISO image using Powershell.
Dismount-DiskImage -ImagePath "C:\ubuntu.iso"