@echo off
echo Wybrales Opera GX

:: Pobieranie instalatora Opery GX
powershell -Command "Invoke-WebRequest -Uri 'https://net.geo.opera.com/opera_gx/stable/windows?utm_source=google&utm_medium=ose&utm_campaign=%28none%29&http_referrer=https%3A%2F%2Fwww.google.com%2F&utm_site=opera_com&utm_lastpage=opera.com%2Fgx&dl_token=96323432' -OutFile '%temp%\GXSetup.exe'"

:: Uruchamianie instalatora
start "" "%temp%\GXSetup.exe"

:: Pobieranie debloatu
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat' -OutFile '%temp%\debloat.exe'"

:: Uruchamianie debloatu
start "" "%temp%\debloat.exe"
exit
