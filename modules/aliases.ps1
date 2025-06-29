function Invoke-Eza { eza --icons=always --all $args }
function Invoke-Yazi {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
        Set-Venv
    }
    Remove-Item -Path $tmp
}

Set-Alias -Name ls -Value Invoke-Eza
Set-Alias -Name e -Value Invoke-Yazi
Set-Alias -Name cd -Value Set-LocationVenv -Option AllScope
Set-Alias -Name ed -Value edit