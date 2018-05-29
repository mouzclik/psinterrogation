# The following lines deomnstrate basic registry manipulation via powershell

$reboot_name = "Reboot_Counter"
$reboot_path = "C:\users\<insert username>\desktop\logins.ps1" # Customize with your username or change the path
$logon_name = "Logon_Counter"
$logon = "C:\users\Conde\desktop\reboots.ps1"
$machine_run = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
$user_run = "HKCU:\Software\Mic    rosoft\Windows\CurrentVersion\Run"

New-ItemProperty -Path $machine_run -Name $reboot_name -Value $reboot_path -PropertyType string -Force | Out-Null
New-ItemProperty -Path $user_run -Name $logon_name -Value $user_run -PropertyType string -Force | Out-Null
Get-EventLog -LogName system | where {$_.EventID -eq "6006"} >> c:\users\<username>\reboots.txt -Force | Out-Null