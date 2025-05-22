# Wymuszenie uruchomienia jako administrator
$currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell.exe"
    $arguments = "-NoProfile -ExecutionPolicy Bypass -File `"" + $MyInvocation.MyCommand.Definition + "`""
    $psi.Arguments = $arguments
    $psi.Verb = "runas"
    try {
        [System.Diagnostics.Process]::Start($psi) | Out-Null
    }
    catch {
        Write-Error "Brak uprawnień administratora lub anulowano podwyższenie."
    }
    exit
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Get-WindowsVersion {
    $version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName
    if ($version -like "*Windows 11*") { return "Windows 11" }
    elseif ($version -like "*Windows 10*") { return "Windows 10" }
    else { return "Inny lub nieznany system" }
}

function Download-AndRunScript {
    param (
        [string]$url
    )
    $output = "$env:TEMP\wyborprzegladarki.ps1"
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
        Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$output`"" -Verb RunAs
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show("Błąd pobierania lub uruchamiania skryptu:`n$($_.Exception.Message)", "Błąd", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

# Tworzenie okna
$form = New-Object System.Windows.Forms.Form
$form.Text = "Wybór systemu Windows"
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)

$fontTitle = New-Object System.Drawing.Font("Segoe UI",14,[System.Drawing.FontStyle]::Bold)
$fontText = New-Object System.Drawing.Font("Segoe UI",10)

# Label z tytułem
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Aktualny system operacyjny:"
$labelTitle.Font = $fontTitle
$labelTitle.ForeColor = [System.Drawing.Color]::FromArgb(50, 50, 50)
$labelTitle.AutoSize = $true
$labelTitle.Location = New-Object System.Drawing.Point(20, 15)
$form.Controls.Add($labelTitle)

# Label z nazwą wersji Windows
$labelVersion = New-Object System.Windows.Forms.Label
$labelVersion.Font = $fontTitle
$labelVersion.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$labelVersion.AutoSize = $true
$labelVersion.Location = New-Object System.Drawing.Point(300, 15)
$form.Controls.Add($labelVersion)

# Label z opisem
$labelDesc = New-Object System.Windows.Forms.Label
$labelDesc.Font = $fontText
$labelDesc.ForeColor = [System.Drawing.Color]::FromArgb(70, 70, 70)
$labelDesc.Size = New-Object System.Drawing.Size(550, 250)
$labelDesc.Location = New-Object System.Drawing.Point(20, 60)
$labelDesc.AutoSize = $false
$form.Controls.Add($labelDesc)

# Przycisk akcji
$btnAction = New-Object System.Windows.Forms.Button
$btnAction.Size = New-Object System.Drawing.Size(200, 50)
$btnAction.Location = New-Object System.Drawing.Point(200, 310)
$btnAction.Font = New-Object System.Drawing.Font("Segoe UI",12,[System.Drawing.FontStyle]::Bold)
$btnAction.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$btnAction.ForeColor = [System.Drawing.Color]::White
$btnAction.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnAction.FlatAppearance.BorderSize = 0
$form.Controls.Add($btnAction)

# Wczytanie wersji Windows
$winVersion = Get-WindowsVersion
$labelVersion.Text = $winVersion

switch ($winVersion) {
    "Windows 10" {
        $labelDesc.Text = @"
Windows 10:
- Stabilny i sprawdzony system
- Szeroka kompatybilność z oprogramowaniem
- Znany i szeroko używany

Kliknij przycisk poniżej, aby pobrać i uruchomić dedykowany skrypt.
"@
        $btnAction.Text = "Pobierz i uruchom skrypt"
        $btnAction.Add_Click({
            $url = "https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/10/Main/wyborprzegladarki.ps1"
            $result = [System.Windows.Forms.MessageBox]::Show("Czy na pewno chcesz pobrać i uruchomić skrypt dla Windows 10?", "Potwierdzenie", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
            if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
                Download-AndRunScript -url $url
            }
        })
    }
    "Windows 11" {
        $labelDesc.Text = @"
Windows 11:
- Nowoczesny, odświeżony interfejs
- Lepsze wsparcie dla nowych technologii
- Ulepszenia wydajności i bezpieczeństwa

Kliknij przycisk poniżej, aby pobrać i uruchomić dedykowany skrypt.
"@
        $btnAction.Text = "Pobierz i uruchom skrypt"
        $btnAction.Add_Click({
            $url = "https://github.com/Relive-Team/relivedebloat/raw/refs/heads/main/11/Main/wyborprzegladarki.ps1"
            $result = [System.Windows.Forms.MessageBox]::Show("Czy na pewno chcesz pobrać i uruchomić skrypt dla Windows 11?", "Potwierdzenie", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
            if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
                Download-AndRunScript -url $url
            }
        })
    }
    default {
        $labelDesc.Text = "Nie rozpoznano systemu Windows 10 lub Windows 11."
        $btnAction.Text = "Zamknij"
        $btnAction.Add_Click({ $form.Close() })
    }
}

$form.Topmost = $true
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
