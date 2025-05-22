Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Dodaj klasę obsługującą zdarzenia z HTML-a
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

[ComVisible(true)]
public class ScriptInterface
{
    public void StartChrome()
    {
        System.Diagnostics.Process.Start("chrome10.bat");
    }
}
"@ -ReferencedAssemblies "System.Runtime.InteropServices"

$form = New-Object Windows.Forms.Form
$form.Text = "Wbudowana przeglądarka"
$form.Width = 1024
$form.Height = 768

$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = "Fill"
$browser.ScriptErrorsSuppressed = $true

# Załaduj index.html
$localHtml = Join-Path $PSScriptRoot "index.html"
$browser.Url = "http://relive-team.github.io/relivedebloat/wyborprzegladarki.html"

# Przypisz obiekt z metodą do komunikacji z JavaScript
$scriptInterface = New-Object ScriptInterface
$browser.ObjectForScripting = $scriptInterface

$form.Controls.Add($browser)
$form.ShowDialog()
