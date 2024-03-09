Start-Process -FilePath cleanmgr.exe -ArgumentList '/VERYLOWDISK /AUTOCLEAN'

While ((Get-Process -Name cleanmgr).MainWindowTitle -ne "Disk Space Notification") {Start-Sleep 1}

Stop-Process -Name cleanmgr -Force -ErrorAction SilentlyContinue

# sageset, tuneup reg keys https://learn.microsoft.com/en-us/troubleshoot/windows-server/backup-and-storage/automating-disk-cleanup-tool#registry-key-information