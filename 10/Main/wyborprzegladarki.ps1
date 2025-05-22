Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Klasa C# do obsługi JavaScript z HTML
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using System.Net;
using System.IO;

[ComVisible(true)]
public class ScriptInterface
{
    private WebBrowser _browser;

    public ScriptInterface(WebBrowser browser)
    {
        _browser = browser;
    }

    private void DownloadAndRun(string name)
    {
        string url = $"https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/Przegladarki/{name}10.bat";
        string path = Path.Combine(Path.GetTempPath(), $"{name}10.bat");

        using (WebClient wc = new WebClient())
        {
            wc.DownloadFile(url, path);
        }

        System.Diagnostics.Process.Start(path);

        _browser.Invoke(new Action(() => {
            _browser.Url = new Uri("https://relive-team.github.io/relivedebloat/install.html");
        }));
    }

    public void StartChrome() { DownloadAndRun("chrome"); }
    public void StartFirefox() { DownloadAndRun("firefox"); }
    public void StartBrave() { DownloadAndRun("brave"); }
    public void StartOperaGX() { DownloadAndRun("operaGX"); }
}
"@ -ReferencedAssemblies @("System.Windows.Forms", "System.Net")

# Tworzenie pełnoekranowego okna
$form = New-Object Windows.Forms.Form
$form.Text = "Wybór przeglądarki"
$form.FormBorderStyle = 'None'
$form.WindowState = 'Maximized'
$form.TopMost = $true

# Kontrolka WebBrowser
$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = 'Fill'
$browser.ScriptErrorsSuppressed = $true

# Przekazanie kontrolki do C# jako interfejsu skryptowego
$scriptInterface = New-Object ScriptInterface($browser)
$browser.ObjectForScripting = $scriptInterface

# Załaduj lokalny index.html
$localHtml = Join-Path $PSScriptRoot "index.html"
$browser.Url = "file:///$localHtml"

$form.Controls.Add($browser)
$form.ShowDialog()
