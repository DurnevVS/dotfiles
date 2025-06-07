if (-not (Get-CommandIsInstalled oh-my-posh) -and $wingetInstalled) {
    winget install JanDeDobbeleer.OhMyPosh -s winget
}
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression