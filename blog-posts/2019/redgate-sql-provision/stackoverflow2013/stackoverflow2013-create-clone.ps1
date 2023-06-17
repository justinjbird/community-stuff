$imageName = "StackOverflow2013" 

Write-Output "Creating clones for: $imageName"

$gds = Get-Date -Format u
Write-Output "Start: $gds" 

Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$image = Get-SqlCloneImage -Name $imageName
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer001' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer002' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer003' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer004' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer005' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer006' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer007' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer008' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer009' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Developer010' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Test001' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Test002' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_Test003' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'StackOverflow2013_clone_PreProd' -Location $sqlServerInstance | Wait-SqlCloneOperation

$gde = Get-Date -Format u
Write-Output "End: $gde"

$diff = New-TimeSpan -Start $gds -End $gde
Write-Output "Duration: $diff"

pause