function Get-CommandIsInstalled {
    param ([string]$command)
    return $null -ne (Get-Command $command -ErrorAction Ignore)
}

Write-Host "Checking for winget..." -ForegroundColor Yellow
if (-not (Get-CommandIsInstalled winget)) {
    Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
    $wingetInstalled = Get-CommandIsInstalled winget
}


# List of packages to install via winget
$packages = @(
    @{ Command = "oh-my-posh"; Id = "JanDeDobbeleer.OhMyPosh" },
    @{ Command = "gh"; Id = "GitHub.cli" },
    @{ Command = "eza"; Id = "eza-community.eza" },
    @{ Command = "edit"; Id = "Microsoft.Edit" },
    # Yazi and its dependencies
    @{ Command = "yazi"; Id = "sxyazi.yazi" },
    @{ Command = "ffmpeg"; Id = "Gyan.FFmpeg" },
    @{ Command = "7z"; Id = "7zip.7zip" },
    @{ Command = "jq"; Id = "jqlang.jq" },
    @{ Command = "fd"; Id = "sharkdp.fd" },
    @{ Command = "rg"; Id = "BurntSushi.ripgrep.MSVC" },
    @{ Command = "fzf"; Id = "junegunn.fzf" },
    @{ Command = "zoxide"; Id = "ajeetdsouza.zoxide" },
    @{ Command = "magick"; Id = "ImageMagick.ImageMagick" }
)

foreach ($package in $packages) {
    if (-not (Get-CommandIsInstalled $package.Command)) {
        Write-Host "Installing $($package.Command) ($($package.Id))..."
        winget install -e --id $package.Id --accept-package-agreements --accept-source-agreements
    }
    else {
        Write-Host "$($package.Command) is already installed."
    }
}
