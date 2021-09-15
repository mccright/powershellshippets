# PowerShell Command Line Reference Scripts  

### PWSH Grep
```powershell
powershell "(Select-String -Path "<searchPath>" -Pattern "<searchString>)"
```

### Windows endpoint WiFi & Firewall information  
```powershell
$wifiinfo = "`n`n WLAN Info:`n" + ((netsh wlan show all)  -join "`r`n"); $wifiinfo = $wifiinfo + "`n`n Firewall Info:`n" + ((netsh firewall show all)  -join "`r`n"); Write-Host ($wifiinfo)
```
