namespace Proyecto1_BD1
{
	partial class Form1
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
            this.openConection = new System.Windows.Forms.Button();
            this.closeConection = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // openConection
            // 
            this.openConection.Location = new System.Drawing.Point(48, 357);
            this.openConection.Name = "openConection";
            this.openConection.Size = new System.Drawing.Size(75, 23);
            this.openConection.TabIndex = 0;
            this.openConection.Text = "Open BD";
            this.openConection.UseVisualStyleBackColor = true;
            this.openConection.Click += new System.EventHandler(this.openConection_Click);
            // 
            // closeConection
            // 
            this.closeConection.Location = new System.Drawing.Point(218, 357);
            this.closeConection.Name = "closeConection";
            this.closeConection.Size = new System.Drawing.Size(75, 23);
            this.closeConection.TabIndex = 1;
            this.closeConection.Text = "Close BD";
            this.closeConection.UseVisualStyleBackColor = true;
            this.closeConection.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(438, 447);
            this.Controls.Add(this.closeConection);
            this.Controls.Add(this.openConection);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Button openConection;
		private System.Windows.Forms.Button closeConection;
	}
}

