# This model is only for scripts that you write and understand
# First, **if** you understand the risks associated with executing the code,
# ensure that the PowerShell Execution Policy is set to 'ByPass'
$registryPath = "HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
$Name = "ExecutionPolicy"
$valueString = "ByPass"
$execPol = (Get-ItemProperty -Path $registryPath -Name $Name).$Name

if(!($execPol -eq $valueString))  { 
    New-ItemProperty -Path $registryPath -Name $name -Value $valueString -PropertyType String -Force | Out-Null
    }

# Now do whatever scripting that we need to do
# ...
# ...
# ...

# After completing everything we needed to do, 
# set the PowerShell Execution Policy back to 'RemoteSigned'
$valueString = "RemoteSigned"
$execPol = (Get-ItemProperty -Path $registryPath -Name $Name).$Name

if(!($execPol -eq $valueString))  { 
    New-ItemProperty -Path $registryPath -Name $name -Value $valueString -PropertyType String -Force | Out-Null
    }

