namespace Proyecto1_BD1
{
	partial class ConectarServidorForm
	{
		/// <summary>
		/// Variable del diseñador necesaria.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Limpiar los recursos que se estén usando.
		/// </summary>
		/// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Código generado por el Diseñador de Windows Forms

		/// <summary>
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido de este método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{
            this.AbrirConexionBtn = new System.Windows.Forms.Button();
            this.comboBoxBD = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // AbrirConexionBtn
            // 
            this.AbrirConexionBtn.Location = new System.Drawing.Point(159, 166);
            this.AbrirConexionBtn.Name = "AbrirConexionBtn";
            this.AbrirConexionBtn.Size = new System.Drawing.Size(149, 24);
            this.AbrirConexionBtn.TabIndex = 0;
            this.AbrirConexionBtn.Text = "Conectar";
            this.AbrirConexionBtn.UseVisualStyleBackColor = true;
            this.AbrirConexionBtn.Click += new System.EventHandler(this.openConection_Click);
            // 
            // comboBoxBD
            // 
            this.comboBoxBD.FormattingEnabled = true;
            this.comboBoxBD.Items.AddRange(new object[] {
            "DESKTOP-QHTQCVG",
            "PC Josue"});
            this.comboBoxBD.Location = new System.Drawing.Point(159, 49);
            this.comboBoxBD.Name = "comboBoxBD";
            this.comboBoxBD.Size = new System.Drawing.Size(149, 21);
            this.comboBoxBD.TabIndex = 1;
            this.comboBoxBD.Tag = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(37, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Nombre del servidor:";
            // 
            // ConectarServidorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(337, 223);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.comboBoxBD);
            this.Controls.Add(this.AbrirConexionBtn);
            this.Name = "ConectarServidorForm";
            this.Text = "Conectar con el servidor";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button AbrirConexionBtn;
		private System.Windows.Forms.ComboBox comboBoxBD;
		private System.Windows.Forms.Label label1;
    }
}

