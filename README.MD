# PWsh config
Кастомный конфиг для PowerShell 7

## Установка
```shell
git clone https://github.com/DurnevVS/dotfiles.git
cd dotfiles
". $(Join-Path -Path $PWD -ChildPath 'pwsh' | Join-Path -ChildPath 'init.ps1')" | Add-Content -Path $profile
```
## В сборку вошли
- Тулинг командной строки
    - oh-my-posh
    - eza
    - yazi
    - edit

- Тулинг git
    - github cli

- Тулинг Python
    - uv + autocompletions
    - pyvenv-switcher

- Кастомные алиасы и горячие клавиши

