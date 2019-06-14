function Get-PSPublicAPIEntry
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
        [Switch]
        $Category
    )

    $uri = "${baseUri}entries"
    $entries = (Invoke-RestMethod -Method Get -UseBasicParsing -Uri $uri).Entries
    return $entries
}
