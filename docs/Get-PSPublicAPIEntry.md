# Get-PSPublicAPIEntry

Gets specific APIs for a given criteria or all API entries from the public API service

## Parameters

| Parameter Name | Description                                                  | Is Mandatory? |
| -------------- | ------------------------------------------------------------ | ------------- |
| Title          | Specifies a substring from the public API title. No wildcards supported. |               |
| Description    | Specifies a substring from the public API description. No wildcards supported. |               |
| Authentication | Specifies type of authentication supported by the API. This can be either null or a specific value supported by API like oauth. |               |
| HttpsOnly      | A switch parameter that specifies if only https supported APIs should be returned |               |
| Cors           | Specifies the CORS support within the public API. Valid values are yes, no, and unknown. |               |
| Category       | Specifies the category of the public API.                    |               |

## Examples

```powershell
Get-PSPublicAPIEntry -Verbose
```

This command returns all the entries from the public API service

```powershell
Get-PSPublicAPIEntry -Title 'at' -Verbose
```

 This command returns all the entries from the public API service where the title contains a substring 'at'.