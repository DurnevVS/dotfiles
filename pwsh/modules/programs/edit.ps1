if (-not (Get-CommandIsInstalled edit) -and $wingetInstalled) {
    winget install Microsoft.Edit
}