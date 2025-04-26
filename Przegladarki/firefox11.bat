@echo off
echo Wybrales Firefox.
:: Pobieranie instalatora Firefoksa
powershell -Command "Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl' -OutFile '%temp%\FirefoxInstaller.exe'"

:: Uruchamianie instalatora
start "" "%temp%\FirefoxInstaller.exe"

echo Instalator Firefoksa zostal pobrany i uruchomiony!

:: Pobieranie debloatu
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat' -OutFile '%temp%\debloat.exe'"

:: Uruchamianie debloatu
start "" "%temp%\debloat.bat"
exit
