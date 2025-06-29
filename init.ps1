oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression

$modulesPath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Get-ChildItem -Path $modulesPath | ForEach-Object {
    . $_.FullName
}
