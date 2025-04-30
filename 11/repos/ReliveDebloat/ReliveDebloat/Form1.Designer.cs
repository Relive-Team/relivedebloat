namespace ReliveDebloat
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.btnFirefox = new System.Windows.Forms.Button();
            this.btnChrome = new System.Windows.Forms.Button();
            this.btnBrave = new System.Windows.Forms.Button();
            this.btnOpera = new System.Windows.Forms.Button();
            this.btnSkip = new System.Windows.Forms.Button();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // Form1
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(350, 550);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "Form1";
            this.Text = "Relive Debloat";
            this.BackColor = System.Drawing.Color.FromArgb(30, 30, 30); // ciemne tło
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.RowCount = 5;
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.BackColor = System.Drawing.Color.FromArgb(30, 30, 30);
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            for (int i = 0; i < 5; i++)
            {
                this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            }
            this.tableLayoutPanel1.Controls.Add(this.btnFirefox, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.btnChrome, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.btnBrave, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.btnOpera, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.btnSkip, 0, 4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.Size = new System.Drawing.Size(350, 550);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // Styl wspólny
            //
            var buttonFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);

            // btnFirefox
            this.btnFirefox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnFirefox.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnFirefox.FlatAppearance.BorderSize = 0;
            this.btnFirefox.Font = buttonFont;
            this.btnFirefox.ForeColor = System.Drawing.Color.White;
            this.btnFirefox.BackColor = System.Drawing.Color.FromArgb(255, 69, 0); // pomarańczowy
            this.btnFirefox.Margin = new System.Windows.Forms.Padding(30, 10, 30, 10);
            this.btnFirefox.Name = "btnFirefox";
            this.btnFirefox.Text = "Firefox";
            this.btnFirefox.UseVisualStyleBackColor = false;
            this.btnFirefox.Click += new System.EventHandler(this.btnFirefox_Click);

            // btnChrome
            this.btnChrome.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnChrome.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnChrome.FlatAppearance.BorderSize = 0;
            this.btnChrome.Font = buttonFont;
            this.btnChrome.ForeColor = System.Drawing.Color.White;
            this.btnChrome.BackColor = System.Drawing.Color.FromArgb(251, 192, 6); // #fbc006
            this.btnChrome.Margin = new System.Windows.Forms.Padding(30, 10, 30, 10);
            this.btnChrome.Name = "btnChrome";
            this.btnChrome.Text = "Chrome";
            this.btnChrome.UseVisualStyleBackColor = false;
            this.btnChrome.Click += new System.EventHandler(this.btnChrome_Click);

            // btnBrave
            this.btnBrave.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnBrave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBrave.FlatAppearance.BorderSize = 0;
            this.btnBrave.Font = buttonFont;
            this.btnBrave.ForeColor = System.Drawing.Color.White;
            this.btnBrave.BackColor = System.Drawing.Color.FromArgb(255, 102, 0); // rdzawy pomarańcz
            this.btnBrave.Margin = new System.Windows.Forms.Padding(30, 10, 30, 10);
            this.btnBrave.Name = "btnBrave";
            this.btnBrave.Text = "Brave";
            this.btnBrave.UseVisualStyleBackColor = false;
            this.btnBrave.Click += new System.EventHandler(this.btnBrave_Click);

            // btnOpera
            this.btnOpera.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnOpera.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOpera.FlatAppearance.BorderSize = 0;
            this.btnOpera.Font = buttonFont;
            this.btnOpera.ForeColor = System.Drawing.Color.White;
            this.btnOpera.BackColor = System.Drawing.Color.FromArgb(250, 30, 78); // #fa1e4e
            this.btnOpera.Margin = new System.Windows.Forms.Padding(30, 10, 30, 10);
            this.btnOpera.Name = "btnOpera";
            this.btnOpera.Text = "Opera GX";
            this.btnOpera.UseVisualStyleBackColor = false;
            this.btnOpera.Click += new System.EventHandler(this.btnOpera_Click);

            // btnSkip
            this.btnSkip.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnSkip.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSkip.FlatAppearance.BorderSize = 0;
            this.btnSkip.Font = buttonFont;
            this.btnSkip.ForeColor = System.Drawing.Color.White;
            this.btnSkip.BackColor = System.Drawing.Color.FromArgb(100, 100, 100); // szary
            this.btnSkip.Margin = new System.Windows.Forms.Padding(30, 10, 30, 10);
            this.btnSkip.Name = "btnSkip";
            this.btnSkip.Text = "Pomiń";
            this.btnSkip.UseVisualStyleBackColor = false;
            this.btnSkip.Click += new System.EventHandler(this.btnSkip_Click);

            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Button btnFirefox;
        private System.Windows.Forms.Button btnChrome;
        private System.Windows.Forms.Button btnBrave;
        private System.Windows.Forms.Button btnOpera;
        private System.Windows.Forms.Button btnSkip;
    }
}
