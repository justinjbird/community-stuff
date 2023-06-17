$imageName = "StackOverflow2010" 

Write-Output "Deleting image for: $imageName"

$gds = Get-Date -Format u
Write-Output "Start: $gds" 

Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName ""

Get-SqlCloneImage -Name $imageName | Remove-SqlCloneImage | Wait-SqlCloneOperation

$gde = Get-Date -Format u
Write-Output "Finish: $gde"

$diff = New-TimeSpan -Start $gds -End $gde
Write-Output "Duration: $diff"

pause