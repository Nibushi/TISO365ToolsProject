function Add-TISBulkUsers{
 <#
 .SYNOPSIS
 Short description
 
 .DESCRIPTION
 Long description

 .PARAMETER csvPath
 Path to a CSV file which must contain the following fields: Display Name, FirstName, LastName, UserPrincipalName,UsageLocation, AccountSkuId
 
 .EXAMPLE
 An example
 
 .NOTES
 General notes
 #>
 [CmdletBinding()]
 Param(
    [string]$csvPath
 )

 Write-Verbose "Test"
    
}