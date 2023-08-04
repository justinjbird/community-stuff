$events = Import-Csv -Path events-messenger/data/talks.csv
$next = ($events | Select-Object time -Unique -First 1).time
$nextEvents = ($events | Where-Object { $_.time -eq $next })
$nextEventsMessage = @()
$nextEventsMessage += "Coming up next...\n\n"
if ($nextEvents) {
  foreach ($event in $nextEvents) {
    $nextEventsMessage += "$($event.name) with '$($event.talk)' in the $($event.room) room\n\n"
  }
}
$message = "{""text"":""${nextEventsMessage}""}"
Write-Output "::set-output name=message::$message"
