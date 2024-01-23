##script powershell from motorcyle
$dist = Read-Host "Enter the distance between both motorcycles (km/h)"
$m1 = Read-Host "Enter the speed of motorcycle 1."
$m2 = Read-Host "Enter the speed of motorcycle 2."

$time = ($dist / ($m2-$m1)) * 60

Write-Host "The second motorcycle will catch up to motorcycle 1 in $time minutes "
