params (
  [Parameter(Mandatory=$true)]
  [string]$uri,
  [Parameter(Mandatory=$true)]
  [string]$title,
  [Parameter(Mandatory=$true)]
  [string]$message
)
$json = [PSCustomObject][Ordered]@{
  "@type" = "MessageCard"
  "@context" = "<http://schema.org/extensions>"
  # "summary" = "Meine erste Alert-Summary!"
  # "themeColor" = '0078D7'
  "title" = $title
  "text" = $message
} | ConvertTo-Json
$params = @{
  "URI" = $uri
  "Method" = "POST"
  "Body" = $json
  "contentType" = "application/json"
}
Invoke-RestMethod $params
