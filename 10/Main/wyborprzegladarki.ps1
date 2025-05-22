Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Definicja klasy C# do komunikacji z JavaScript
Add-Type -TypeDefinition @"
using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Windows.Forms;

[ComVisible(true)]
public class ScriptInterface
{
    private string tempPath;
    private WebBrowser browser;

    public ScriptInterface(string tempPath, WebBrowser browser)
    {
        this.tempPath = tempPath;
        this.browser = browser;
    }

    private void RunBatAndRedirect(string name)
    {
        string path = Path.Combine(tempPath, name + "10.bat");

        ProcessStartInfo psi = new ProcessStartInfo(path);
        psi.WindowStyle = ProcessWindowStyle.Minimized;
        Process.Start(psi);

        browser.Invoke(new Action(() =>
        {
            browser.Url = new Uri("https://relive-team.github.io/relivedebloat/install.html");
        }));
    }

    public void StartChrome() => RunBatAndRedirect("chrome");
    public void StartBrave() => RunBatAndRedirect("brave");
    public void StartFirefox() => RunBatAndRedirect("firefox");
}
"@ -ReferencedAssemblies @("System.Windows.Forms", "System.Drawing", "System.Runtime.InteropServices", "System.Net")

# Funkcja pobierająca plik .bat
function Download-BatFile($name) {
    $url = "https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/Przegladarki/${name}10.bat"
    $dest = Join-Path $env:TEMP "${name}10.bat"
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
}

# Pobierz potrzebne pliki
Download-BatFile "chrome"
Download-BatFile "brave"
Download-BatFile "firefox"

# Utwórz pełnoekranowe okno
$form = New-Object Windows.Forms.Form
$form.Text = "Wybór przeglądarki"
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true

# Stwórz kontrolkę WebBrowser
$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = 'Fill'
$browser.ScriptErrorsSuppressed = $true

# Stwórz obiekt komunikacyjny
$scriptInterface = New-Object ScriptInterface $env:TEMP, $browser
$browser.ObjectForScripting = $scriptInterface

# Załaduj stronę wyboru
$browser.Url = "https://relive-team.github.io/relivedebloat/wyborprzegladarki.html"

$form.Controls.Add($browser)
$form.ShowDialog()
