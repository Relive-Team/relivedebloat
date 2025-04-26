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
        public Form1()
        {
            InitializeComponent();

            // Wyłączenie zmiany rozmiaru okna
            this.FormBorderStyle = FormBorderStyle.FixedDialog;

            // Wyłączenie przycisku maksymalizacji
            this.MaximizeBox = false;

            // Opcjonalnie: Wyłączenie przycisku minimalizacji
            this.MinimizeBox = false;

            // Ustawienie stałego rozmiaru okna
            this.Size = new System.Drawing.Size(800, 600);  // Możesz zmienić wymiary w razie potrzeby
        }

        // Funkcja pobierająca plik .bat z internetu do folderu tymczasowego
        private async Task<string> DownloadFileAsync(string url, string fileName)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    // Pobieramy plik
                    byte[] fileBytes = await client.GetByteArrayAsync(url);

                    // Określamy ścieżkę do folderu %temp% i zapisywanie pliku
                    string tempFolderPath = Path.GetTempPath();
                    string filePath = Path.Combine(tempFolderPath, fileName);

                    // Zapisujemy plik na dysku
                    File.WriteAllBytes(filePath, fileBytes);

                    return filePath;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Błąd podczas pobierania pliku: {ex.Message}");
                return null;
            }
        }

        // Funkcja uruchamiająca pobrany plik .bat
        private void RunBatchFile(string filePath)
        {
            try
            {
                Process.Start(filePath); // Uruchamiamy plik .bat
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Błąd podczas uruchamiania pliku: {ex.Message}");
            }
        }

        // Akcja po kliknięciu przycisku Opera GX
        private async void btnOpera_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/operagx11.bat";
            string filePath = await DownloadFileAsync(url, "operagx.bat");

            // Jeśli plik został poprawnie pobrany, uruchamiamy go
            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Firefox
        private async void btnFirefox_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/firefox11.bat";
            string filePath = await DownloadFileAsync(url, "firefox.bat");

            // Jeśli plik został poprawnie pobrany, uruchamiamy go
            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Chrome
        private async void btnChrome_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/chrome11.bat";
            string filePath = await DownloadFileAsync(url, "chrome.bat");

            // Jeśli plik został poprawnie pobrany, uruchamiamy go
            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Brave
        private async void btnBrave_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/Przegladarki/brave11.bat";
            string filePath = await DownloadFileAsync(url, "brave.bat");

            // Jeśli plik został poprawnie pobrany, uruchamiamy go
            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }

        // Akcja po kliknięciu przycisku Pomiń
        private async void btnSkip_Click(object sender, EventArgs e)
        {
            string url = "https://raw.githubusercontent.com/Relive-Team/relivedebloat/refs/heads/main/11/debloat.bat";
            string filePath = await DownloadFileAsync(url, "debloat.bat");

            // Jeśli plik został poprawnie pobrany, uruchamiamy go
            if (filePath != null)
            {
                RunBatchFile(filePath);
            }
        }
    }
}
