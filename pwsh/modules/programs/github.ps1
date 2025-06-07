if (-not (Get-CommandIsInstalled gh) -and $wingetInstalled) {
    winget install --id GitHub.cli
}