function Get-PSPublicAPIRandomEntry
{
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
        [ValidateSet('yes','no','unknown')]
        [String]
        $Cors,

        [Parameter()]
        [String]
        $Category
    )

    $uri = "${baseUri}random"

    $queryParameters = @{}
    if ($Title)
    {
        $queryParameters.Add('title',$Title)        
    }

    if ($Description)
    {
        $queryParameters.Add('description',$Description)        
    }

    if ($Authentication)
    {
        $queryParameters.Add('auth',$Authentication)
    }

    if ($HttpsOnly)
    {
        $queryParameters.Add('https',$true)
    }

    if ($Cors)
    {
        $queryParameters.Add('cors',$Cors)        
    }

    if ($Category)
    {
        $queryParameters.Add('category',$Category)
    }
    
    $queryUri = Get-HttpQueryString -Uri $uri -QueryParameter $queryParameters
    $entries = (Invoke-RestMethod -Method Get -UseBasicParsing -Uri $queryUri).Entries

    return $entries
}
