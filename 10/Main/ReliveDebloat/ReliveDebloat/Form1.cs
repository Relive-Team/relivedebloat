using System;
using System.Diagnostics;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ReliveDebloat
{
    public partial class Form1 : Form
    {
        // Label do wyświetlania komunikatów
        private Label statusLabel;

        public Form1()
        {
            InitializeComponent();

            // Wyłączenie zmiany rozmiaru okna
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Size = new System.Drawing.Size(800, 600);  // Możesz zmienić wymiary w razie potrzeby

            // Zmiana tekstu przycisku Chrome i jego dezaktywacja
            btnChrome.Text = "Chrome - niedostępny";
            btnChrome.Enabled = false;

            // Dodanie labela do wyświetlania komunikatów
            statusLabel = new Label();
            statusLabel.Dock = DockStyle.Fill;
            statusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            statusLabel.ForeColor = System.Drawing.Color.White;
            statusLabel.Font = new System.Drawing.Font("Segoe UI", 14, System.Drawing.FontStyle.Bold);
            statusLabel.BackColor = System.Drawing.Color.FromArgb(30, 30, 30);
            statusLabel.Text = "Wybierz przeglądarkę, aby rozpocząć proces...";
            this.Controls.Add(statusLabel);
        }

        // Funkcja pobierająca plik .bat z internetu do folderu tymczasowego
        private async Task<string> DownloadFileAsync(string url, string fileName)
        {
            try
            {
                statusLabel.Text = "Pobieranie pliku...";

                using (HttpClient client = new HttpClient())
                {
                    byte[] fileBytes = await client.GetByteArrayAsync(url);
                    string tempFolderPath = Path.GetTempPath();
                    string filePath = Path.Combine(tempFolderPath, fileName);
                    File.WriteAllBytes(filePath, fileBytes);

                    statusLabel.Text = $"Plik {fileName} został pobrany.";
                    return filePath;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Błąd podczas pobierania pliku: {ex.Message}");
                statusLabel.Text = "Błąd pobierania pliku.";
                return null;
            }
        }

        // Funkcja uruchamiająca pobrany plik .bat
        private void RunBatchFile(string filePath)
        {
            try
            {
                statusLabel.Text = "Uruchamianie procesu...";
                Process.Start(filePath);
                statusLabel.Text = "Proces uruchomiony pomyślnie.";
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Błąd podczas uruchamiania pliku: {ex.Message}");
                statusLabel.Text = "Błąd uruchamiania pliku.";
            }
        }

        // Akcja po kliknięciu przycisku Opera GX
        private async void btnOpera_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/operagx10.bat";
            string filePath = await DownloadFileAsync(url, "operagx.bat");

            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Firefox
        private async void btnFirefox_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/firefox10.bat";
            string filePath = await DownloadFileAsync(url, "firefox.bat");

            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Brave
        private async void btnBrave_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/brave10.bat";
            string filePath = await DownloadFileAsync(url, "brave.bat");

            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Pomiń
        private async void btnSkip_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/10/debloat.bat";
            string filePath = await DownloadFileAsync(url, "debloat.bat");

            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Chrome - niedostępny, ale funkcja zostaje (opcjonalnie)
        private async void btnChrome_Click(object sender, EventArgs e)
        {
            // Nieaktywny – nie będzie wywołane, jeśli btnChrome.Enabled = false
        }
    }
}
