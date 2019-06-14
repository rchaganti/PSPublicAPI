function Get-PSPublicAPICategory
{
    [CmdletBinding()]
    param 
    (

    )

    $uri = "${baseUri}categories"
    $categories = Invoke-RestMethod -Method Get -UseBasicParsing -uri $uri

    return $categories
}
