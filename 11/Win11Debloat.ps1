& ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -RunDefaults -Silent

# Zamykanie procesów związanych z PowerShell i relivedebloat
# Ścieżka do pliku VBS
$vbscriptPath = "$env:TEMP\restart_system.vbs"

# Treść skryptu VBS
$vbscriptContent = @"
Dim response
response = MsgBox("Instalacja zostala zakonczona. Czy restartowac system? (zalecane)", vbYesNo + vbQuestion, "Restart systemu")

If response = vbYes Then
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "shutdown.exe -r -t 0", 0, True
End If
"@

# Zapisanie pliku VBS
Set-Content -Path $vbscriptPath -Value $vbscriptContent -Encoding ASCII

# Uruchomienie skryptu
Start-Process "wscript.exe" -ArgumentList "`"$vbscriptPath`""

Stop-Process -Name "powershell" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "pwsh" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "relivedebloat" -Force -ErrorAction SilentlyContinue

Write-Output "Pobieranie i uruchamianie skryptu install_finished.vbs..."

# Pobieranie skryptu install_finished.vbs
$installPath = "$env:TEMP\install_finished.vbs"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/install_finished.vbs" -OutFile $installPath

# Uruchomienie skryptu VBS
Start-Process "wscript.exe" -ArgumentList "`"$installPath`"" -Wait
