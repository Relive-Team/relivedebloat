# ==== Minimalizacja okna PowerShell ====
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
# 2 = SW_MINIMIZE
[Win]::ShowWindow([Win]::GetConsoleWindow(), 2)

# ==== Tytuł i komunikat ====
$Host.UI.RawUI.WindowTitle = "ReliveDebloat10 - Instalacja Opera GX"
Write-Host "Wybrales Opera GX"

# ==== Pobieranie instalatora Opera GX ====
$operaUrl = 'https://net.geo.opera.com/opera_gx/stable/windows?utm_source=google&utm_medium=ose&utm_campaign=%28none%29&http_referrer=https%3A%2F%2Fwww.google.com%2F&utm_site=opera_com&utm_lastpage=opera.com%2Fgx&dl_token=96323432'
$operaInstaller = "$env:TEMP\GXSetup.exe"

Invoke-WebRequest -Uri $operaUrl -OutFile $operaInstaller
Start-Process -FilePath $operaInstaller

# ==== Pobieranie debloatu ====
$debloatUrl = 'https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/10/debloat.bat'
$debloatScript = "$env:TEMP\debloat.bat"

Invoke-WebRequest -Uri $debloatUrl -OutFile $debloatScript
Start-Process -FilePath $debloatScript
