@echo off
title ReliveDebloat11
:: Odliczanie
echo 5...
timeout /t 1 >nul
echo 4...
timeout /t 1 >nul
echo 3...
timeout /t 1 >nul
echo 2...
timeout /t 1 >nul
echo 1...
timeout /t 1 >nul
color 2
echo ###############################
echo #                             #
echo #   ZACZYNAM INSTALOWANIE!    #
echo #                             #
echo ###############################
timeout /t 1 >nul
title ReliveDebloat11 - Instalowanie
color 07
:: Zmienianie wartosci GlobalUserDisabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f

echo Zmiana w rejestrze zostala zastosowana!

:: Zmienianie wartosci DisableWindowsConsumerFeatures
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f

echo Zmiana w rejestrze zostala zastosowana!

:: Wylaczenie Windows Copilot
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f

:: Ukrycie przycisku Copilot
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f

echo Zmiany w rejestrze zostaly wprowadzone!

:: Zmienianie wartosci GameDVR_DXGIHonorFSEWindowsCompatible
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f

echo Zmiana w rejestrze zostala zastosowana!

:: Wylaczenie Windows Copilot
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f

:: Wylaczenie przycisku Copilot
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f

echo Zmiany w rejestrze zostaly wprowadzone!

:: Wylaczenie Centrum powiadomien
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f

:: Wylaczenie powiadomien Toast
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f

echo Zmiany w rejestrze zostaly wprowadzone!

:: Wylaczenie Microsoft Compatibility Appraiser
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE

:: Wylaczenie ProgramDataUpdater
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE

:: Wylaczenie Proxy
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE

:: Wylaczenie Consolidator
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE

:: Wylaczenie UsbCeip
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE

:: Wylaczenie Microsoft-Windows-DiskDiagnosticDataCollector
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE

:: Wylaczenie DmClient
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /DISABLE

:: Wylaczenie DmClientOnScenarioDownload
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /DISABLE

:: Wylaczenie QueueReporting
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE

:: Wylaczenie MareBackup
schtasks /Change /TN "Microsoft\Windows\Application Experience\MareBackup" /DISABLE

:: Wylaczenie StartupAppTask
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE

:: Wylaczenie PcaPatchDbTask
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /DISABLE

:: Wylaczenie MapsUpdateTask
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /DISABLE

echo Wszystkie zadania zostaly wylaczone!

:: Zmienianie wartosci AllowTelemetry
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci ContentDeliveryAllowed
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci OemPreInstalledAppsEnabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci PreInstalledAppsEnabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci PreInstalledAppsEverEnabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci SilentInstalledAppsEnabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f

:: Kolejne zmiany rejestru...
:: Ze wzglÄ™du na ograniczenia miejsca i liczbÄ™ kluczy, pelna lista bÄ™dzie kontynuowana podobnie jak powyĹĽej.

echo Zmiany w rejestrze zostaly zastosowane!

:: Zmienianie wartosci GameDVR_FSEBehavior
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f

:: Zmienianie wartosci GameDVR_Enabled
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci GameDVR_HonorUserFSEBehaviorMode
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f

:: Zmienianie wartosci GameDVR_EFSEFeatureFlags
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d 0 /f

:: Zmienianie wartosci AllowGameDVR
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /t REG_DWORD /d 0 /f

echo Zmiany w rejestrze zostaly zastosowane!


:: Pobieranie Edge Remover
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/Remove-NoTerm.exe' -OutFile '%temp%\Remove-NoTerm.exe'"

:: Uruchamianie Edge Remover
start "" "%temp%\Remove-NoTerm.exe"

:: Pozbycie siÄ™ procesow OneDrive
taskkill /f /im OneDrive.exe

:: Odinstalowywanie OneDrive
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall

:: Zmiana wartosci System.IsPinnedToNameSpaceTree na 0
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f

echo Zmiana w rejestrze zostala zastosowana!

:: Dodanie klucza rejestru, aby przywrociÄ‡ klasyczne menu kontekstowe
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f

:: Restartowanie Eksploratora Windows, aby zastosowaÄ‡ zmiany
taskkill /f /im explorer.exe
start explorer.exe

echo Klasyczne menu kontekstowe zostalo przywrocone!

:: Wylaczenie DragFullWindows
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d 0 /f

:: Ustawienie MenuShowDelay
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 200 /f

:: Wylaczenie MinAnimate
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MinAnimate" /t REG_SZ /d 0 /f

:: Ustawienie KeyboardDelay
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d 0 /f

:: Wylaczenie ListviewAlphaSelect
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f

:: Wylaczenie ListviewShadow
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f

:: Wylaczenie TaskbarAnimations
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f

:: Ustawienie VisualFXSetting
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f

:: Wylaczenie EnableAeroPeek
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f

:: Wylaczenie TaskbarMn
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f

:: Wylaczenie TaskbarDa
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f

:: Wylaczenie ShowTaskViewButton
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f

:: Wylaczenie SearchboxTaskbarMode
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

echo Zmiany w rejestrze zostaly zastosowane!

:: Ustawienie wyrownania paska zadan na lewo
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f

:: Restartowanie Eksploratora Windows, aby zastosowaÄ‡ zmiany
taskkill /f /im explorer.exe
start explorer.exe

echo Pasek zadan zostal przeniesiony na lewa stronÄ™!

:: Wylaczenie widĹĽetow
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f

:: Restartowanie Eksploratora Windows, aby zastosowaÄ‡ zmiany
taskkill /f /im explorer.exe
start explorer.exe

echo WidĹĽety zostaly wylaczone!

:: Wlaczenie TargetReleaseVersion, aby zatrzymaÄ‡ aktualizacje funkcji
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersion" /t REG_DWORD /d 1 /f

echo Aktualizacje funkcji zostaly wylaczone!

:: Ustawienie ciemnego motywu
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f

:: Wylaczenie Bing Search w menu Start
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f

:: Wylaczenie rekomendacji w menu Start
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t REG_DWORD /d 0 /f

:: Wylaczenie Snap Windows
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WindowArrangementActive" /t REG_SZ /d 0 /f

:: Wylaczenie Snap Assist Suggestions
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d 0 /f

:: Wylaczenie Sticky Keys
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d 506 /f

:: Wlaczenie rozszerzen plikow
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

:: Restartowanie Eksploratora Windows, aby zastosowaÄ‡ zmiany
taskkill /f /im explorer.exe
start explorer.exe

echo Zmiany zostaly wprowadzone!

:: Wlaczenie szczegolow BSOD
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d 1 /f

echo Szczegoly BSOD zostaly wlaczone!

:: Usuwanie wszystkiego z taskbar
DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F
taskkill /f /im explorer.exe
start explorer.exe

:: Pobieranie tapety
set wallpaperUrl=https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Tapety/tapeta.bmp
set wallpaperPath=%temp%\tapeta.bmp

powershell -Command "Invoke-WebRequest -Uri '%wallpaperUrl%' -OutFile '%wallpaperPath%'"

:: Ustawienie pobranej tapety jako tla pulpitu
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaperPath%" /f

:: Ustawienie stylu tla (dopasowanie do ekranu)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 10 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d 0 /f

:: OdĹ›wieĹĽenie ustawien pulpitu
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 1,True

echo Tapeta zostaĹ‚a pobrana i ustawiona!

:: Pobieranie Win11Debloat
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/Win11Debloat.ps1' -OutFile '%temp%\Win11Debloat.ps1'"

:: Uruchomienie Win11Debloat
powershell -NoProfile -ExecutionPolicy Bypass -File "%temp%\Win11Debloat.ps1"

:: Restart
shutdown.exe -r -t 0
exit







