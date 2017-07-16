Task Test -description "Run Pester Tests" {
    PowerShell.exe -NoProfile -NonInteractive -Command "Invoke-Pester -EnableExit -Show None"
}

Task UpdateModuleManifest -description "Add Public Functions to module manifest" -depends Test -precondition {$LASTEXITCODE -eq 0}{
    $projectRoot = Resolve-Path "$PSScriptRoot"
    $manifestPath = Resolve-Path "$projectRoot\*\*.psd1"
    $moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psd1")

    if(Test-Path $moduleRoot\Public){
        $publicFunctions = Get-ChildItem "$moduleRoot\Public" -recurse -Include *.ps1

        $funcsToExport = foreach($pf in $publicFunctions){
            $fileName = Split-Path $pf.fullname -leaf
            $funcName = $fileName.Split('.')[0]
            $funcName
        }

        $params = @{
            Path = $manifestPath
            FunctionsToExport = $funcsToExport
        }

        Update-ModuleManifest @params
    }
}

Task Default -depends UpdateModuleManifest