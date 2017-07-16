$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psd1")
$modulepsd1 = Resolve-Path "$projectRoot\*\*.psd1"
$moduleName = Split-Path $moduleRoot -Leaf

Import-Module -FullyQualifiedName $modulepsd1 -Force

Describe 'Add-TisBulkUser'{
    
}