 ﻿### Various basic registry commands, I personally output to a file as baseline and compare at another point in time to search changes
### These are meant to be a very basic starting point
### In order to compare, an example block could be:

### $file1 = Get-Content regbaseline1.txt
### $file2 = Get-Content regbaseline.txt
### Compare-Object -ReferenceObject $file1 -DifferenceObject $file2 -PassThru | Sort

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\'

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\'

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Wow6432Node\'

Get-childitem -Force -recurse -path 'HKLM:\System\CurrentControlSet\Services'

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows'

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Font Drivers'

Get-childitem -Force -recurse -path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Drivers32'

Get-childitem -Force -recurse -path 'HKLM:\SOFTWARE\Classes\Htmlfile\Shell\Open\Command'

Get-childitem -Force -recurse -path registry::HKU
