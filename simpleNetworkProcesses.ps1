### The following lines can be used to investigate networked processes

$pids=Get-NetTCPConnection -state listen # Obtain all listening connections. Ports, IPs, and owning processes will be contained
$pidsbynumber=($pids.owningprocess | % {Get-Process -Id $_}) # We can now group this information into processes by PID numbers

### These steps are useful to create a baseline if a known bad process is executed
### A simple comparator can be created by:

### Compare-Object -ReferenceObject $pidsbynumberbefore $pidsbynumberafter -PassThru | Sort