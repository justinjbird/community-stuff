$imageName = "AdventureWorksDW2017" 

Write-Output "Creating image for: $imageName"

$gds = Get-Date -Format u
Write-Output "Start: $gds" 

Connect-SqlClone -ServerUrl 'http://localhost:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName DESKTOP-H4M4K2E -InstanceName "" `

$imageDestination = Get-SqlCloneImageLocation -Path '\\DESKTOP-H4M4K2E\Image'

$myMaskingModification = New-SqlCloneMask -Path 'C:\Code\demos-redgate-sql-provision\adventureworks\adventureworksDW2017.DMSMaskSet'

$imageOperation = New-SqlCloneImage -Name $imageName `
  -SqlServerInstance $sqlServerInstance `
  -BackupFileName @('\\vmware-host\Shared Folders\Backups\AdventureWorksDW2017.bak') `
  -Destination $imageDestination `
  -Modifications $myMaskingModification 

$imageOperation | Wait-SqlCloneOperation

$gde = Get-Date -Format u
Write-Output "Finish: $gde"

$diff = New-TimeSpan -Start $gds -End $gde
Write-Output "Duration: $diff"

pause