$i = Get-NetAdapter -Physical
$i | ForEach-Object {
	if ($_.Status -eq "Up") {
		Set-DnsClientServerAddress $_.InterfaceAlias -ResetServerAddresses
		Restart-NetAdapter -Name $_.InterfaceAlias
	}
	
}
Clear-DnsClientCache;
