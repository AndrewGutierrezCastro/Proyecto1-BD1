namespace Proyecto1_BD1.View
{
    partial class VentanaInsertarParte
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.guardarParteBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.nombreTxt = new System.Windows.Forms.TextBox();
            this.marcaTxt = new System.Windows.Forms.TextBox();
            this.fabricanteTxt = new System.Windows.Forms.TextBox();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // guardarParteBtn
            // 
            this.guardarParteBtn.Location = new System.Drawing.Point(240, 86);
            this.guardarParteBtn.Name = "guardarParteBtn";
            this.guardarParteBtn.Size = new System.Drawing.Size(85, 38);
            this.guardarParteBtn.TabIndex = 0;
            this.guardarParteBtn.Text = "Guardar";
            this.guardarParteBtn.UseVisualStyleBackColor = true;
            this.guardarParteBtn.Click += new System.EventHandler(this.guardarParteBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Nombre";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(21, 86);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Marca";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(21, 153);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(109, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Nombre de fabricante";
            // 
            // nombreTxt
            // 
            this.nombreTxt.Location = new System.Drawing.Point(24, 51);
            this.nombreTxt.Name = "nombreTxt";
            this.nombreTxt.Size = new System.Drawing.Size(187, 20);
            this.nombreTxt.TabIndex = 4;
            // 
            // marcaTxt
            // 
            this.marcaTxt.Location = new System.Drawing.Point(24, 110);
            this.marcaTxt.Name = "marcaTxt";
            this.marcaTxt.Size = new System.Drawing.Size(187, 20);
            this.marcaTxt.TabIndex = 5;
            // 
            // fabricanteTxt
            // 
            this.fabricanteTxt.Location = new System.Drawing.Point(24, 181);
            this.fabricanteTxt.Name = "fabricanteTxt";
            this.fabricanteTxt.Size = new System.Drawing.Size(187, 20);
            this.fabricanteTxt.TabIndex = 6;
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(240, 163);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(85, 38);
            this.cancelarBtn.TabIndex = 7;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            this.cancelarBtn.Click += new System.EventHandler(this.cancelarBtn_Click);
            // 
            // VentanaInsertarParte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.fabricanteTxt);
            this.Controls.Add(this.marcaTxt);
            this.Controls.Add(this.nombreTxt);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.guardarParteBtn);
            this.Name = "VentanaInsertarParte";
            this.Size = new System.Drawing.Size(345, 235);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button guardarParteBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox nombreTxt;
        private System.Windows.Forms.TextBox marcaTxt;
        private System.Windows.Forms.TextBox fabricanteTxt;
        private System.Windows.Forms.Button cancelarBtn;
    }
}
