Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

[ComVisible(true)]
public class ScriptInterface
{
    private Form _form;

    public ScriptInterface(Form form)
    {
        _form = form;
    }

    public void StartChrome()
    {
        string temp = Environment.GetEnvironmentVariable(""TEMP"");
        string path = System.IO.Path.Combine(temp, ""chrome10.bat"");
        System.Diagnostics.Process.Start(path);
        _form.Invoke(new Action(() => { _form.Close(); }));
    }
    
    public void StartFirefox()
    {
        string temp = Environment.GetEnvironmentVariable(""TEMP"");
        string path = System.IO.Path.Combine(temp, ""firefox10.bat"");
        System.Diagnostics.Process.Start(path);
        _form.Invoke(new Action(() => { _form.Close(); }));
    }

    public void StartBrave()
    {
        string temp = Environment.GetEnvironmentVariable(""TEMP"");
        string path = System.IO.Path.Combine(temp, ""brave10.bat"");
        System.Diagnostics.Process.Start(path);
        _form.Invoke(new Action(() => { _form.Close(); }));
    }

    public void StartOperaGX()
    {
        string temp = Environment.GetEnvironmentVariable(""TEMP"");
        string path = System.IO.Path.Combine(temp, ""operaGX10.bat"");
        System.Diagnostics.Process.Start(path);
        _form.Invoke(new Action(() => { _form.Close(); }));
    }
}
"@ -ReferencedAssemblies @("System.Runtime.InteropServices", "System.Windows.Forms")

$form = New-Object Windows.Forms.Form
$form.Text = "Wbudowana przeglądarka"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Normal
$screenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
$screenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height
$form.Size = New-Object System.Drawing.Size($screenWidth, $screenHeight)
$form.Location = New-Object System.Drawing.Point(0, 0)
$form.TopMost = $true

$browser = New-Object Windows.Forms.WebBrowser
$browser.Dock = "Fill"
$browser.ScriptErrorsSuppressed = $true

# Tworzymy instancję klasy i przekazujemy form
$scriptInterface = New-Object ScriptInterface($form)
$browser.ObjectForScripting = $scriptInterface

$localHtml = Join-Path $PSScriptRoot "index.html"
$browser.Url = "file:///$localHtml"

$form.Controls.Add($browser)
$form.ShowDialog()
