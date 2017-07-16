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

 Write-Verbose "Test"
    
}