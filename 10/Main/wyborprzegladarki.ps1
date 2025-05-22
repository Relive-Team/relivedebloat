Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Definicja klasy do komunikacji z JS
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Diagnostics;

[ComVisible(true)]
public class ScriptInterface
{
    private string tempPath;

    public ScriptInterface(string tempPath)
    {
        this.tempPath = tempPath;
    }

    public void StartChrome()
    {
        Process.Start(System.IO.Path.Combine(tempPath, "chrome10.bat"));
    }

    public void StartBrave()
    {
        Process.Start(System.IO.Path.Combine(tempPath, "brave10.bat"));
    }

    public void StartFirefox()
    {
        Process.Start(System.IO.Path.Combine(tempPath, "firefox10.bat"));
    }
}
"@ -ReferencedAssemblies "System.Runtime.InteropServices"

# Funkcja do pobrania pliku .bat do %TEMP%
function Download-BatFile($name) {
    $url = "https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/Przegladarki/${name}10.bat"
    $dest = Join-Path $env:TEMP "${name}10.bat"
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
    return $dest
}

# Pobierz pliki
Download-BatFile "chrome"
Download-BatFile "brave"
Download-BatFile "firefox"

# Utwórz okno w pełnym ekranie
$form = New-Object Windows.Forms.Form
$form.Text = "Wbudowana przeglądarka"
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None

# Przeglądarka
$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = "Fill"
$browser.ScriptErrorsSuppressed = $true

# Załaduj stronę
$browser.Url = "http://relive-team.github.io/relivedebloat/wyborprzegladarki.html"

# Przypisz obiekt do komunikacji JS <-> PowerShell
$scriptInterface = New-Object ScriptInterface $env:TEMP
$browser.ObjectForScripting = $scriptInterface

$form.Controls.Add($browser)
$form.ShowDialog()
