Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$CloneToDelete = Get-SqlClone -Name 'AdventureWorksDW2017_clone_Dev2' -Location $SqlServerInstance
Remove-SqlClone -Clone $CloneToDelete | Wait-SqlCloneOperation

Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$imageName = "AdventureWorksDW2017" 

$image = Get-SqlCloneImage -Name $imageName
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev2' -Location $sqlServerInstance | Wait-SqlCloneOperation





