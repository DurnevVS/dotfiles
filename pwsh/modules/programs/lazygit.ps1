if (-not (Get-CommandIsInstalled lazygit) -and $wingetInstalled) {
    winget install -e --id=JesseDuffield.lazygit
}