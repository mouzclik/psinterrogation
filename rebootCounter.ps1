# This script would enumerate the amount of reboots a machine takes

Get-eventlog -logname system | where {$_.EventID -eq “6006”} >> c:\users\<username>\reboots.txt -Force | out-null # Customize username or change path
$count = 0
$reader = New-Object IO.StreamReader 'reboots.txt'
while($reader.ReadLine() -ne $null){ $count++ }
$reader.Close()
write-host "Current amount of reboots as of:" (get-date) "is" $count >> C:\Users\<username>\desktop\allogins.txt -Force | Out-Null