# add dns over https templates

<#
$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors){
    Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
    Write-Host " on $bgcolor"
}
#>

Write-Host -ForegroundColor Cyan  ">_ add DoH dns.sb"
Write-Host "[" $PSCommandPath "]"



Add-DnsClientDohServerAddress -ServerAddress 185.222.222.222 -DohTemplate https://doh.dns.sb/dns-query -errorAction SilentlyContinue
Add-DnsClientDohServerAddress -ServerAddress 45.11.45.11 -DohTemplate https://doh.dns.sb/dns-query -errorAction SilentlyContinue

# set dns for each physical adapter

$i = Get-NetAdapter -Physical
$i | ForEach-Object {
	if ($_.Status -eq "Up") {
		Set-DnsClientServerAddress $_.InterfaceAlias -ResetServerAddresses
		Set-DnsClientServerAddress $_.InterfaceAlias -ServerAddresses "185.222.222.222","45.11.45.11"
		$s1 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\185.222.222.222'; New-Item -Path $s1 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD
		$s2 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\45.11.45.11'; New-Item -Path $s2 -Force  | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType QWORD
	
#		Restart-NetAdapter -Name $_.InterfaceAlias
	}
	
}
Clear-DnsClientCache;

<#
$i = Get-WmiObject Win32_NetworkAdapterConfiguration -Filter 'IpEnabled=True AND DhcpEnabled=True' 
$i | Foreach-Object {
	$_.RenewDHCPLease()
}
#>