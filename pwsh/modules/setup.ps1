function Get-CommandIsInstalled {
    param (
        [string]$command
    )
    return $null -ne (Get-Command $command -ErrorAction Ignore)
}

if (-not (Get-CommandIsInstalled winget)) {
    Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
    $Global:wingetInstalled = $null -ne (Get-Command winget -ErrorAction Ignore)
}

$programsFolder = Get-ChildItem -Path $PSScriptRoot .\programs
foreach ($script in Get-ChildItem $programsFolder) {
    . $script.FullName
}

. $PSScriptRoot\key-bindings.ps1
. $PSScriptRoot\aliases.ps1
. $PSScriptRoot\user.ps1