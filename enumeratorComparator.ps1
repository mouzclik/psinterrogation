# This enumerator script is meant to work with two instance output files of the enumerator.ps1 script

$file1 = Get-Content enum1.txt #Initialize both script outputs to variables
$file2 = Get-Content enum2.txt

echo "`nHow to interpret output: both objects and their differences are printed sequentially, process size in KBs`n"

Compare-Object $file1 $file2 -PassThru | Sort-Object > differences.txt

# Both enumerator output files will be formatted and stored in another variable

$enum1=(Get-ChildItem -recurse -force $env:SystemRoot -ErrorAction SilentlyContinue | ? {( $_.psiscontainer -eq $false) -and ($_.name -like "enum2.txt")} | Select-Object name, directory | Format-Table -AutoSize *)
$enum2=(Get-ChildItem -recurse -force $env:SystemRoot -ErrorAction SilentlyContinue | ? {( $_.psiscontainer -eq $false) -and ($_.name -like "enum2.txt")} | Select-Object name, directory | Format-Table -AutoSize *)

#The differences will be output into a variable
$differences=(Get-ChildItem -recurse -force $env:SystemRoot -ErrorAction SilentlyContinue | ? {( $_.psiscontainer -eq $false) -and ($_.name -like "differences.txt")} | Select-Object name, directory | Format-Table -AutoSize *)
Write-output (Get-Content differences.txt)

Write-host "`r`nFirst enum file located in:"
echo $enum1
Write-host "Second enum file located in:"
echo $enum2
Write-host "Differences file located in:"
echo $differences