$RegKey = “HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon”
ForEach ($subkey in “AutoAdminLogon”, “DefaultPassword”)
{
	if (Get-ItemProperty -Name $subkey -path $RegKey -ErrorAction SilentlyContinue)
	{
		Remove-ItemProperty -Path $RegKey -Name $subkey
	}
}