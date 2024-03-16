
Function DisableCopilot
{  
 $path = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"    
 If(!(Test-Path -Path $path)) { 
     New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "WindowsCopilot"
 } 
 Set-ItemProperty -Path $path -Name "TurnOffWindowsCopilot" -Value 1 
 #Restart Explorer to change it immediately    
 Stop-Process -name explorer
}
DisableCopilot