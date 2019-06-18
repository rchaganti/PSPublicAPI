<#
.SYNOPSIS
    Gets the state of Public API
.DESCRIPTION
    Gets the health state of public API service
.EXAMPLE
    Get-PSPublicAPIHealth

    This command get the health of the public API service.
#>
function Get-PSPublicAPIHealth {
    [CmdletBinding()]
    param 
    (

    )

    $uri = "${baseUri}health"

    Write-Verbose -Message 'Getting the health state of Public API service.'
    Invoke-RestMethod -Method get -UseBasicParsing -Uri $uri
}
