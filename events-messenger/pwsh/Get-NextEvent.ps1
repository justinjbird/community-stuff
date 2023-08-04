param(
  [Parameter(Mandatory = $true)]
  [string]$path
)

$events = Import-Csv -Path $path
$next = ($events | Select-Object time -Unique -First 1).time
$nextEvents = ($events | Where-Object { $_.time -eq $next })
$message = @()
$message += "Coming up next...\n\n"
if ($nextEvents) {
  foreach ($event in $nextEvents) {
    "**$($event.name)** with **$($event.talk)** in the [$($event.room)](https://google.co.uk) room\n\n"
  }
}
Write-Output "message=$message" >> $env:GITHUB_OUTPUT
