<#
.SYNOPSIS
    Gets public API entries
.DESCRIPTION
    Gets specific APIs for a given criteria or all API entries from the public API service
.PARAMETER Title
    Specifies a substring from the public API title. No wildcards supported.
.PARAMETER Description
    Specifies a substring from the public API description. No wildcards supported.
.PARAMETER Authentication
    Specifies type of authentication supported by the API. This can be either null or a specific value supported by API like oauth.
.PARAMETER HttpsOnly
    A switch parameter that specifies if only https supported APIs should be returned
.PARAMETER Cors
    Specifies the CORS support within the public API. Valid values are yes, no, and unknown.
.PARAMETER Category
    Specifies the category of the public API.
.EXAMPLE
    Get-PSPublicAPIEntry -Verbose

    This command returns all the entries from the public API service
.EXAMPLE
    Get-PSPublicAPIEntry -Title 'at' -Verbose

    This command returns all the entries from the public API service where the title contains a substring at.
#>
function Get-PSPublicAPIEntry {
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [String]
        $Title,

        [Parameter()]
        [String]
        $Description,

        [Parameter()]
        [String]
        $Authentication,

        [Parameter()]
        [Switch]
        $HttpsOnly,

        [Parameter()]
        [ValidateSet('yes', 'no', 'unknown')]
        [String]
        $Cors,

        [Parameter()]
        [String]
        $Category
    )

    $uri = "${baseUri}entries"

    $queryParameters = @{ }
    if ($Title) {
        $queryParameters.Add('title', $Title)        
    }

    if ($Description) {
        $queryParameters.Add('description', $Description)        
    }

    if ($Authentication) {
        $queryParameters.Add('auth', $Authentication)
    }

    if ($HttpsOnly) {
        $queryParameters.Add('https', $true)
    }

    if ($Cors) {
        $queryParameters.Add('cors', $Cors)        
    }

    if ($Category) {
        $queryParameters.Add('category', $Category)
    }
    
    $queryUri = Get-HttpQueryString -Uri $uri -QueryParameter $queryParameters
    $entries = (Invoke-RestMethod -Method Get -UseBasicParsing -Uri $queryUri).Entries

    return $entries
}
