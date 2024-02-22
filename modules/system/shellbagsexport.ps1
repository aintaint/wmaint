##Create parent folder for storing retrieved artifacts
$DesktopPath = [Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
New-Item -Path "$DesktopPath\Forensics" -ItemType Directory
$parentFolder = "$DesktopPath\Forensics"


##BEGIN SCRIPT:
Write-Host "Beginning extraction"


##SHELLBAGS
Write-Host "Generating ShellBag CSVs"
Function ShellBags {
New-Item -Path C:\Users\User\Desktop\Forensics\Shellbags -ItemType Directory
Get-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU' | 
    Export-Csv -Path "$parentFolder\Shellbags\Shellbags_MRU.csv" -UseCulture -NoTypeInformation
Get-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags' |
     Export-Csv -Path "$parentFolder\Shellbags\Shellbags.csv" -UseCulture -NoTypeInformation
Get-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache'| 
    Export-Csv -Path "$parentFolder\Shellbags\Shellbags_MUIcache.csv" -UseCulture -NoTypeInformation
}
ShellBags 


##JUMPLISTS:
Write-Host "Generating JumpLists CSV"
Function JumpLists {
New-Item -Path .\USERS\USER\DESKTOP\Forensics\JumpLists -ItemType Directory
Get-ItemProperty -Path 'C:\Users\*\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations' | 
    Export-Csv -Path "$parentFolder\JumpLists\JumpLists.csv" -UseCulture -NoTypeInformation
}
JumpLists