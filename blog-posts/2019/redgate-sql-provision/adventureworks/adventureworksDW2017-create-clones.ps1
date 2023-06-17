$imageName = "AdventureWorksDW2017" 

Write-Output "Creating clones for: $imageName"

$gds = Get-Date -Format u
Write-Output "Start: $gds" 


Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$image = Get-SqlCloneImage -Name $imageName
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev1' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev2' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev3' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev4' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev5' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev6' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Dev7' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Test1' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Test2' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_Test3' -Location $sqlServerInstance | Wait-SqlCloneOperation
$image | New-SqlClone -Name 'AdventureWorksDW2017_clone_PreProd' -Location $sqlServerInstance | Wait-SqlCloneOperation

$gde = Get-Date -Format u
Write-Output "Finish: $gde"

$diff = New-TimeSpan -Start $gds -End $gde
Write-Output "Duration: $diff"

pause