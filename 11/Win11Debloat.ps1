& ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -RunDefaults -Silent
# Zamykanie procesów związanych z PowerShell i relivedebloat
Stop-Process -Name "powershell" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "pwsh" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "relivedebloat" -Force -ErrorAction SilentlyContinue

Write-Output "Pobieranie i uruchamianie skryptu install_finished.vbs..."

# Pobieranie skryptu install_finished.vbs
$installPath = "$env:TEMP\install_finished.vbs"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/install_finished.vbs" -OutFile $installPath

# Uruchomienie skryptu VBS
Start-Process "wscript.exe" -ArgumentList "`"$installPath`"" -Wait
