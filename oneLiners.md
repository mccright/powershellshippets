# PowerShell Command Line Reference Scripts  

### PWSH Grep
```powershell
powershell "(Select-String -Path "<searchPath>" -Pattern "<searchString>)"
```

### Windows endpoint WiFi & Firewall information  
```powershell
$wifiinfo = "`n`n WLAN Info:`n" + ((netsh wlan show all)  -join "`r`n"); $wifiinfo = $wifiinfo + "`n`n Firewall Info:`n" + ((netsh firewall show all)  -join "`r`n"); Write-Host ($wifiinfo)
```

### Document your .NET Framework installation status:  
The Powershell below emits a more friendly version of the data that can also be accessed with "dotnet --list-runtimes" and "dotnet --list-sdks"  
```powershell
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | Get-ItemProperty -name Version,Release -EA 0 | Where { $_.PSChildName -match '^(?!S)\p{L}'} | Select PSChildName, Version, Release
```
[Thank you Jason]


