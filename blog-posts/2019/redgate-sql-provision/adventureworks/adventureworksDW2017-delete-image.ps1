Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName ""
$imageName = "AdventureWorksDW2017" 

Get-SqlCloneImage -Name $imageName | Remove-SqlCloneImage | Wait-SqlCloneOperation

