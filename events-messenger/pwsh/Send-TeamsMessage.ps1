param(
  [Parameter(Mandatory=$true)]
  [string]$uri,
  [Parameter(Mandatory=$true)]
  [string]$title,
  [Parameter(Mandatory=$true)]
  [string]$message
)
$body = [ordered]@{
  type = "AdaptiveCard"
  body = @(
    [ordered]@{
      type = "TextBlock"
      text = $title
      wrap = $true
      style = "heading"
    }
    [ordered]@{
      type = "ColumnSet"
      columns = @(
        [ordered]@{
          type = "Column"
          width = "stretch"
          items = @(
            [ordered]@{
              type = "TextBlock"
              text = "**Main Room**"
              wrap = $true
            }
            [ordered]@{
              type = "TextBlock"
              text = "<<TBC>>"
              wrap = $true
            }
          )
        }
      )
    }
    [ordered]@{
      type = "ColumnSet"
      columns = @(
        [ordered]@{
          type = "Column"
          width = "stretch"
          items = @(
            [ordered]@{
              type = "TextBlock"
              text = "**Analytics Room**"
              wrap = $true
            }
            [ordered]@{
              type = "TextBlock"
              text = "<<TBC>>"
              wrap = $true
            }
          )
        }
      )
    }
    [ordered]@{
      type = "ColumnSet"
      columns = @(
        [ordered]@{
          type = "Column"
          width = "stretch"
          items = @(
            [ordered]@{
              type = "TextBlock"
              text = "**Synapse Room**"
              wrap = $true
            }
            [ordered]@{
              type = "TextBlock"
              text = "<<TBC>>"
              wrap = $true
            }
          )
        }
      )
    }
  )
  '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
  version = "1.6"
} | ConvertTo-Json -Depth 6
$params = @{
  "URI" = $uri
  "Method" = "POST"
  "Body" = $body
  "contentType" = "application/json"
}
Invoke-RestMethod @params
