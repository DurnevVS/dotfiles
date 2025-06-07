if (-not (Get-CommandIsInstalled eza) -and $wingetInstalled) {
    winget install eza-community.eza
}
function Invoke-Eza { eza --icons=always --all $args }