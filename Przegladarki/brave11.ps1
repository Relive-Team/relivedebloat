# Ustaw tytuł okna
$Host.UI.RawUI.WindowTitle = "ReliveDebloat10 - Instalacja Brave"

# Komunikat startowy
Write-Host "Wybrales Brave"

# Pobieranie instalatora Brave
$braveUrl = 'https://referrals.brave.com/latest/BraveBrowserSetup-BRV010.exe'
$braveInstaller = "$env:TEMP\BraveInstaller.exe"

Invoke-WebRequest -Uri $braveUrl -OutFile $braveInstaller
Start-Process -FilePath $braveInstaller

# Pobieranie debloatu
$debloatUrl = 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat'
$debloatScript = "$env:TEMP\debloat.bat"

Invoke-WebRequest -Uri $debloatUrl -OutFile $debloatScript
Start-Process -FilePath $debloatScript
