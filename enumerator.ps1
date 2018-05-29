#This script is meant to act as an enumerator to establish a baseline and compare it to another snapshot in time

#System date, first line will initialize the file
#and override if a previous base was saved

echo "------------------------`r`nSystem date`r`n------------------------" > enum1.txt
get-date >> enum1.txt

#User accounts and groups

echo "------------------------`r`nUser accounts and groups`r`n------------------------" >> enum1.txt
(get-localgroup).name | %{write-host $_ ; write-host "____________________"; Write-Host $(get-localgroupmember $_)} >> enum1.txt

#Hostname

echo "`r`n------------------------`r`nHostname`r`n------------------------`r`n" >> enum1.txt
$env:username >> enum1.txt

#Logged on users

echo "`r`n------------------------`r`nLogged on users`r`n------------------------`r`n" >> enum1.txt
Get-WmiObject -class win32_loggedonuser -ComputerName $env:COMPUTERNAME | Select-Object -Unique antecedent >> enum1.txt

#Services and their states

echo "`r`n------------------------`r`nServices and their states`r`n------------------------`r`n" >> enum1.txt
get-service >> enum1.txt

#Network configuration: TCP+UDP

echo "`r`n------------------------`r`nNetwork configuration: TCP+UDP`r`n------------------------`r`n" >> enum1.txt
Get-NetIPConfiguration >> enum1.txt
Get-NetTCPConnection >> enum1.txt
Get-NetUDPEndpoint >> enum1.txt

#Listening network sockets

echo "`r`n------------------------`r`nListening network sockets`r`n------------------------`r`n" >> enum1.txt
Get-NetTCPConnection -State Listen >> enum1.txt

#System configuration

echo "`r`n------------------------`r`nSystem Configuration`r`n------------------------`r`n" >> enum1.txt
get-ciminstance win32_operatingsystem | select-object freephysicalmemory, freevirtualmemory, numberofusers, numberofprocesses, systemdrive, version >> enum1.txt

#Mapped drives

echo "`r`n------------------------`r`nMapped Drives`r`n------------------------`r`n" >> enum1.txt
Get-WmiObject -class win32_mappedlogicaldisk | select name >> enum1.txt

#Configured devices

echo "`r`n------------------------`r`nConfigured Devices`r`n------------------------`r`n" >> enum1.txt
get-psdrive c >> enum1.txt

#Shared resources

echo "`r`n------------------------`r`nShared Resources`r`n------------------------`r`n" >> enum1.txt
Get-WmiObject win32_share >> enum1.txt

#Scheduled tasks

echo "`r`n------------------------`r`nScheduled Tasks`r`n------------------------`r`n" >> enum1.txt
get-scheduledtask >> enum1.txt

#Running processes

echo "`r`n------------------------`r`nRunning Processes (in Kbs)`r`n------------------------`r`n" >> enum1.txt
get-process | Select-Object processname, ws  >> enum1.txt
