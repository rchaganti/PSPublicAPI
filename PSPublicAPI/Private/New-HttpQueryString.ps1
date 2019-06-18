<#
.Synopsis
    Creates a new http/s query string.
.DESCRIPTION
    Creates a new http/s query string using the URI and key-value pairs provided.
.PARAMETER Uri
    Specifies the full URI for which the query string needs to be generated.
.PARAMETER QueryParameter
    Specifies the query string parameters as key-value pairs.
.EXAMPLE
    New-HttpQueryString -Uri 'http://localhost' -QueryParameter @{Name='PS';Version=7}

    This command returns the fully-formatted URI with all query strings.
#>

function New-HttpQueryString {
    [CmdletBinding()]
    param 
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Uri,

        [Parameter(Mandatory = $true)]
        [Hashtable]
        $QueryParameter
    )

    # Add System.Web
    Write-Verbose -Message 'Loading system.web .net assembly'
    Add-Type -AssemblyName System.Web

    # Create a http name value collection from an empty string
    Write-Verbose -Message 'Preparing parameter collection'
    $nvCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    foreach ($key in $QueryParameter.Keys) {
        $nvCollection.Add($key, $QueryParameter.$key)
    }

    # Build the uri
    $uriRequest = [System.UriBuilder]$uri
    $uriRequest.Query = $nvCollection.ToString()

    return $uriRequest.Uri.OriginalString
}
