# this shouldn't be unsigned
takeown /F 'C:\Windows\System32\drivers\bthmodem.sys'
icacls 'C:\Windows\System32\drivers\bthmodem.sys' /grant "$($env:USERNAME)":F
rm C:\Windows\System32\drivers\bthmodem.sys -r -fo