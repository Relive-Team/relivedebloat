@echo off
title ReliveDebloat11 - Instalacja Chrome
echo Instalacja Google Chrome za pomoca winget...
REM Sprawdzenie, czy winget jest dostepny
where winget >nul 2>&1
if errorlevel 1 (
    echo Winget nie jest dostepny na tym systemie. Upewnij sie, ze masz Windows 10 2004 lub nowszy oraz zaktualizowany App Installer.
    pause
    exit /b 1
)

REM Instalacja Google Chrome
winget install --id=Google.Chrome --exact --accept-source-agreements --accept-package-agreements

echo Instalacja zakonczona.
exit
