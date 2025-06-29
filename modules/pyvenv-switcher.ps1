function Set-Venv {
    $venvPath = Join-Path -Path $PWD -ChildPath ".venv"
    if (Test-Path -Path $venvPath) {
        $Global:parentVenvPath = $PWD
        . $venvPath/Scripts/Activate.ps1
    } 
    else {
        if (-not $PWD.Path.StartsWith($parentVenvPath.Path) -and (Get-Command deactivate -ErrorAction Ignore)) {
            $parentVenvPath = $null
            deactivate
        }
    }
    
}
function Set-LocationVenv {
    Set-Location @args
    Set-Venv
}

Set-Venv