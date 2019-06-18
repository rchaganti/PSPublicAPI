<#
.SYNOPSIS
    Gets a list of categories for the public API
.DESCRIPTION
    Gets a list of categories for the public API
.EXAMPLE
    Get-PSPublicAPICategory -Verbose

    Gets all categories of public APIs
#>
function Get-PSPublicAPICategory {
    [CmdletBinding()]
    param 
    (

    )

    $uri = "${baseUri}categories"
    Write-Verbose -Message 'Getting a list of categories for the public API'
    $categories = Invoke-RestMethod -Method Get -UseBasicParsing -uri $uri

    return $categories
}
