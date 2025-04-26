echo Wybrales Brave

:: Pobieranie instalatora Brave
powershell -Command "Invoke-WebRequest -Uri 'https://referrals.brave.com/latest/BraveBrowserSetup-BRV010.exe' -OutFile '%temp%\BraveInstaller.exe'"

:: Uruchamianie instalatora
start "" "%temp%\BraveInstaller.exe"

:: Pobieranie debloatu
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/10/debloat.bat' -OutFile '%temp%\debloat.exe'"

:: Uruchamianie debloatu
start "" "%temp%\debloat.exe"
exit
