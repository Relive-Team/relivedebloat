using System;
using System.Windows.Forms;

namespace ReliveDebloat
{
    static class Program
    {
        /// <summary>
        /// Główna metoda aplikacji.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}
