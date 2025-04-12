::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZVWA2RNWSGIrAP4/z0/9aLrUoSGfA6dIbN37CLIuwc61G1JN5+nzRTm8Rs
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDZVWA2RNWSGIrAP4/z0/9aTo10YQOM2aorIzrWcNK4W8kCE
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

:: Pobieranie tapety
set wallpaperUrl=https://reliveteam.eu/relivedebloat11/tapeta.bmp
set wallpaperPath=%temp%\tapeta.bmp

powershell -Command "Invoke-WebRequest -Uri '%wallpaperUrl%' -OutFile '%wallpaperPath%'"

:: Ustawienie pobranej tapety jako tla pulpitu
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaperPath%" /f

:: Ustawienie stylu tla (dopasowanie do ekranu)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 10 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d 0 /f

:: Odświeżenie ustawien pulpitu
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1,True

echo Tapeta została pobrana i ustawiona!

:: Restart komputera
shutdown /r /t 0
