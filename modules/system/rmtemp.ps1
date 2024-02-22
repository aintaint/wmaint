Remove-Item -Path $env:TEMP\* -Recurse -Force 

$tempfolders = @(“C:\Windows\Prefetch\*”, 
	“C:\Documents and Settings\*\Local Settings\temp\*”, 
	“C:\Users\*\Appdata\Local\Temp\*”)

Remove-Item $tempfolders -Force -Recurse