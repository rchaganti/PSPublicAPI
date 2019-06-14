function Get-PSPublicAPIHealth
{
    [CmdletBinding()]
    param 
    (

    )

    $uri = "${baseUri}health"

    Invoke-RestMethod -Method get -UseBasicParsing -Uri $uri
}
