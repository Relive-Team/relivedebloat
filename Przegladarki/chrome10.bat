@echo off
echo Wybrales Google Chrome

:: Pobieranie instalatora Chroma
powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B58C50035-B170-9451-AB0A-4095A732D74F%7D%26lang%3Dpl%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe' -OutFile '%temp%\ChromeSetup.exe'"

:: Uruchamianie instalatora
start "" "%temp%\ChromeSetup.exe"

:: Pobieranie debloatu
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/10/debloat.bat' -OutFile '%temp%\debloat.exe'"

:: Uruchamianie debloatu
start "" "%temp%\debloat.exe"
exit
