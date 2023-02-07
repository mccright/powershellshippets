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


What is the default security protocol for my Windows endpoint?
```powershell
[Net.ServicePointManager]::SecurityProtocol
```

What are the available TLS protocols?
```powershell
[enum]::GetValues('Net.SecurityProtocolType')
```

### Identify Which Cipher Suites Are Enabled on a Windows Endpoint  
```powershell
Get-TlsCipherSuite | Format-Table -Property CipherSuite, CipherBlockLength, Cipher, Hash, Name
```

Set or change the protocol list to just "Tls12":
```powershell
[System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
```

### Troubleshoot SSL/TLS Connection Rejection  
Spill the connection attempt details:  
```powershell
$targetHost = 'https://host.domain.com/';(Invoke-WebRequest -Uri $targetHost).RawContent
```
If you see any TLS errors, try explicitly setting the TLS version:  
```powershell
$targetHost = 'https://host.domain.com/';[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (Invoke-WebRequest -Uri $targetHost).RawContent
```

