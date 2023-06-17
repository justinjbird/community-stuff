Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$ClonesToDelete = Get-SqlClone -Name '*_clone_*' -Location $SqlServerInstance
$ClonesToDelete | Remove-SqlClone | Wait-SqlCloneOperation
