..\edge\killall.ps1
..\system\adddoh.ps1

ivpn connect -exit_svr ch.wg.ivpn.net -antitracker -p wg -l hu.wg.ivpn.net

Read-Host -Prompt "Press any key to continue"

ivpn firewall -persistent_on
ivpn firewall -on