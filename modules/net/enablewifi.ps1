Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Enable-NetAdapter -Confirm:$false

