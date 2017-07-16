function Add-TISBulkUsers{
 <#
 .SYNOPSIS
 Bulk add users to an O365 tenant from a CSV file
 
 .DESCRIPTION
 Long descriptiongit

 .PARAMETER csvPath
 Path to a CSV file which must contain the following fields: Display Name, FirstName, LastName, UserPrincipalName,UsageLocation, AccountSkuId
 
 .EXAMPLE
 An example
 
 .NOTES
 General notes
 #>
 [CmdletBinding()]
 Param(
    [Parameter(Mandatory)]
    [ValidateScript({Test-Path  $_ -PathType file})]
    [string]$csvPath
 )

    try {
        Write-Verbose "Fetching users from $csvPath"
        $users = Import-Csv -Path $csvPath | ForEach-Object {
        
            $newUserParams = @{
                DisplayName = $_.DisplayName
                FirstName = $_.FirstName
                LastName = $_.LastName
                UserPrincipalName = $_.UserPrincipalName
                UsageLocation = $_.UsageLocation
                LicenseAssignment = $_.AccountSkuId
            }

            Write-Verbose "Trying to create new user $($_.UserPrincipalName)"
            New-MsolUser @newUserParams
        }
    }
    catch {
        
    }    
}
