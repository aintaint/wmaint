net stop bits
net stop wuauserv
net stop cryptsvc
net stop msiserver

Remove-Item -Recurse -Force C:\Windows\SoftwareDistribution

$filePath = "C:\Windows\System32\catroot2"

if (Test-Path $filePath) {
	Remove-Item -Recurse -Force $filePath -Verbose
}

net start bits
net start wuauserv
net start cryptsvc
net start msiserver

sc config wuauserv start= auto 
sc config bits start= auto 
sc config cryptsvc start= auto 
sc config trustedinstaller start= auto