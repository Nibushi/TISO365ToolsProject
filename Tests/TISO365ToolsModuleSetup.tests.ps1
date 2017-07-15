$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psd1")
$moduleName = Split-Path $moduleRoot -Leaf

Describe "$moduleName Module Test" {
    Context "Verifying $moduleName setup"{
        #Check for Module
        it "has the root module $moduleName.psm1" {
            "$moduleRoot\$moduleName.psm1" | Should Exist 
        }

        #Check for manifest file associated with module 
            It "has a manifest file called $moduleName.psd1 associated with $moduleName" { 
                "$moduleRoot\$moduleName.psd1" | Should Exist 
                "$moduleRoot\$moduleName.psd1" | Should Contain $moduleName
        }
    }

    $moduleFunctionScripts = Get-ChildItem $moduleRoot -Include *.ps1 -Exclude *.tests.ps1  -Recurse

    foreach($mfs in $moduleFunctionScripts ){
        $fileName = Split-Path $mfs.fullname -leaf
        $funcName = $fileName.Split('.')[0]

        Context "Verifying $fileName set up"{
            It "has a $fileName file"{
                $mfs.fullname | Should Exist
            }

            It "$fileName should have a function called $funcName"{
                $mfs.fullname | Should ContainExactly "function $funcName\b"
            }

            It "$fileName should have a help block" { 
                $mfs.fullname | Should Contain '<#' 
                $mfs.fullname | Should Contain '#>' 
            } 

            It "$fileName should have a SYNOPSIS section in the help block" { 
                $mfs.fullname | Should Contain '.SYNOPSIS'                 
            } 

            It "$fileName should have a DESCRIPTION section in the help block" { 
                $mfs.fullname | Should Contain '.DESCRIPTION'                 
            }

            It "$fileName should have a EXAMPLE section in the help block" { 
                $mfs.fullname | Should Contain '.EXAMPLE'                 
            }

            It "$fileName should be an advanced function" { 
                $mfs.fullname | Should Contain 'function'                 
                $mfs.fullname | Should Contain 'cmdletbinding()' 
                $mfs.fullname | Should Contain 'param'                                 
            } 

            It "$fileName should contain Write-Verbose blocks" { 
                $mfs.fullname | Should Contain 'Write-Verbose'                 
            } 
        } 
    }
}