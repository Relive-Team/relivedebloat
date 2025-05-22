# Funkcja do minimalizacji własnego okna
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
}
"@
# Minimize (2 = SW_MINIMIZE)
[Win]::ShowWindow([Win]::GetConsoleWindow(), 2)

# Info
Write-Host "Wybrales Firefox."

# Pobieranie instalatora Firefoksa
$firefoxUrl = 'https://download.mozilla.org/?product=firefox-stub&os=win&lang=pl'
$firefoxInstaller = "$env:TEMP\FirefoxInstaller.exe"

Invoke-WebRequest -Uri $firefoxUrl -OutFile $firefoxInstaller
Start-Process -FilePath $firefoxInstaller

Write-Host "Instalator Firefoksa zostal pobrany i uruchomiony!"

# Pobieranie debloatu
$debloatUrl = 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat'
$debloatScript = "$env:TEMP\debloat.bat"

Invoke-WebRequest -Uri $debloatUrl -OutFile $debloatScript
Start-Process -FilePath $debloatScript
