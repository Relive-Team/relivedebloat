namespace ReliveDebloat
{
    partial class Form1
    {
        /// <summary>
        /// Wymagana zmienna projektanta.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Zwolnij wszystkie zasoby używane przez komponenty.
        /// </summary>
        /// <param name="disposing">true, jeśli zarządzane zasoby powinny zostać zwolnione; w przeciwnym razie false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Kod generowany przez projektanta

        private void InitializeComponent()
        {
            this.btnFirefox = new System.Windows.Forms.Button();
            this.btnChrome = new System.Windows.Forms.Button();
            this.btnBrave = new System.Windows.Forms.Button();
            this.btnOpera = new System.Windows.Forms.Button();
            this.btnSkip = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnFirefox
            // 
            this.btnFirefox.Location = new System.Drawing.Point(100, 50);
            this.btnFirefox.Name = "btnFirefox";
            this.btnFirefox.Size = new System.Drawing.Size(100, 50);
            this.btnFirefox.TabIndex = 0;
            this.btnFirefox.Text = "Firefox";
            this.btnFirefox.UseVisualStyleBackColor = true;
            this.btnFirefox.Click += new System.EventHandler(this.btnFirefox_Click);
            // 
            // btnChrome
            // 
            this.btnChrome.Location = new System.Drawing.Point(100, 150);
            this.btnChrome.Name = "btnChrome";
            this.btnChrome.Size = new System.Drawing.Size(100, 50);
            this.btnChrome.TabIndex = 1;
            this.btnChrome.Text = "Chrome";
            this.btnChrome.UseVisualStyleBackColor = true;
            this.btnChrome.Click += new System.EventHandler(this.btnChrome_Click);
            // 
            // btnBrave
            // 
            this.btnBrave.Location = new System.Drawing.Point(100, 250);
            this.btnBrave.Name = "btnBrave";
            this.btnBrave.Size = new System.Drawing.Size(100, 50);
            this.btnBrave.TabIndex = 2;
            this.btnBrave.Text = "Brave";
            this.btnBrave.UseVisualStyleBackColor = true;
            this.btnBrave.Click += new System.EventHandler(this.btnBrave_Click);
            // 
            // btnOpera
            // 
            this.btnOpera.Location = new System.Drawing.Point(100, 350);
            this.btnOpera.Name = "btnOpera";
            this.btnOpera.Size = new System.Drawing.Size(100, 50);
            this.btnOpera.TabIndex = 3;
            this.btnOpera.Text = "Opera GX";
            this.btnOpera.UseVisualStyleBackColor = true;
            this.btnOpera.Click += new System.EventHandler(this.btnOpera_Click);
            // 
            // btnSkip
            // 
            this.btnSkip.Location = new System.Drawing.Point(100, 450);
            this.btnSkip.Name = "btnSkip";
            this.btnSkip.Size = new System.Drawing.Size(100, 50);
            this.btnSkip.TabIndex = 4;
            this.btnSkip.Text = "Pomiń";
            this.btnSkip.UseVisualStyleBackColor = true;
            this.btnSkip.Click += new System.EventHandler(this.btnSkip_Click);
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(300, 550);
            this.Controls.Add(this.btnSkip);
            this.Controls.Add(this.btnOpera);
            this.Controls.Add(this.btnBrave);
            this.Controls.Add(this.btnChrome);
            this.Controls.Add(this.btnFirefox);
            this.Name = "Form1";
            this.Text = "Relive Debloat";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnFirefox;
        private System.Windows.Forms.Button btnChrome;
        private System.Windows.Forms.Button btnBrave;
        private System.Windows.Forms.Button btnOpera;
        private System.Windows.Forms.Button btnSkip;
    }
}
