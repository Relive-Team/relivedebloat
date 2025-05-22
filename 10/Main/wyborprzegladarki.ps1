Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Klasa C# poprawiona: bez lambd, z jawnie określonym typem void
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

    private void RunPs1AndRedirect(string name)
    {
        string path = Path.Combine(tempPath, name + "10.ps1");

        ProcessStartInfo psi = new ProcessStartInfo("powershell.exe");
        psi.Arguments = $"-ExecutionPolicy Bypass -WindowStyle Minimized -File \"{path}\"";
        psi.WindowStyle = ProcessWindowStyle.Minimized;
        psi.UseShellExecute = false;
        Process.Start(psi);

        browser.Invoke(new Action(() =>
        {
            browser.Url = new Uri("https://relive-team.github.io/relivedebloat/install.html");
        }));
    }

    public void StartChrome() { RunPs1AndRedirect("chrome"); }
    public void StartBrave() { RunPs1AndRedirect("brave"); }
    public void StartFirefox() { RunPs1AndRedirect("firefox"); }
}
"@ -ReferencedAssemblies @("System.Windows.Forms", "System.Drawing", "System.Runtime.InteropServices", "System.Net")

# Pobieranie plików .ps1
function Download-Ps1File($name) {
    $url = "https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/Przegladarki/${name}10.ps1"
    $dest = Join-Path $env:TEMP "${name}10.ps1"
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
}

Download-Ps1File "chrome"
Download-Ps1File "brave"
Download-Ps1File "firefox"

# Tworzenie formularza
$form = New-Object Windows.Forms.Form
$form.Text = "Wybór przeglądarki"
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true

# WebBrowser
$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = 'Fill'
$browser.ScriptErrorsSuppressed = $true

# Interfejs do komunikacji
$scriptInterface = New-Object ScriptInterface $env:TEMP, $browser
$browser.ObjectForScripting = $scriptInterface

# Załaduj stronę
$browser.Url = "https://relive-team.github.io/relivedebloat/wyborprzegladarki.html"

$form.Controls.Add($browser)
$form.ShowDialog()
