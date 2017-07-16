$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psd1")
$modulepsd1 = (Resolve-Path "$projectRoot\*\*.psd1").ToString()
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module -FullyQualifiedName $modulepsd1 -Force

Describe 'Add-TisBulkUser' -Tag "FunctionTest"{
    It "1 should equal 1" {
        1 -eq 1 | Should Be $true
    }
}