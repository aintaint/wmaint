Write-Output "Not Present: "

$i = Get-NetAdapter -Physical
$i | ForEach-Object {
	if ($_.Status -eq "Not Present") {
		Write-Output "   $($_.InterfaceAlias)"
		
		$regPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$($_.PNPDeviceID)"
		$value = Test-Path $regPath
		if($value) {
			Write-Output "    exists: $regPath"
			Write-Output "    deleting"
		} else {
			Write-Output "    !exists: $regPath"
		}
		
		Get-Item $regPath | Select-Object -ExpandProperty Property | %{ Remove-ItemProperty -Path $regPath -Name $_ -Verbose }

	}
}
