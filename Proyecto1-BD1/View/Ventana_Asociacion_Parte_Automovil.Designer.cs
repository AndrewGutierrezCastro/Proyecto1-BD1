namespace Proyecto1_BD1.View
{
    partial class Ventana_Asociacion_Parte_Automovil
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
            this.asociarBtn = new System.Windows.Forms.Button();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.PartesCmb = new System.Windows.Forms.ComboBox();
            this.TipoAutomovilCmb = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // asociarBtn
            // 
            this.asociarBtn.Location = new System.Drawing.Point(218, 193);
            this.asociarBtn.Name = "asociarBtn";
            this.asociarBtn.Size = new System.Drawing.Size(141, 43);
            this.asociarBtn.TabIndex = 0;
            this.asociarBtn.Text = "Asociar";
            this.asociarBtn.UseVisualStyleBackColor = true;
            this.asociarBtn.Click += new System.EventHandler(this.asociarBtn_Click);
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(18, 193);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(143, 43);
            this.cancelarBtn.TabIndex = 1;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            this.cancelarBtn.Click += new System.EventHandler(this.cancelarBtn_Click);
            // 
            // PartesCmb
            // 
            this.PartesCmb.FormattingEnabled = true;
            this.PartesCmb.Location = new System.Drawing.Point(18, 70);
            this.PartesCmb.Name = "PartesCmb";
            this.PartesCmb.Size = new System.Drawing.Size(341, 21);
            this.PartesCmb.TabIndex = 2;
            // 
            // TipoAutomovilCmb
            // 
            this.TipoAutomovilCmb.FormattingEnabled = true;
            this.TipoAutomovilCmb.Location = new System.Drawing.Point(18, 139);
            this.TipoAutomovilCmb.Name = "TipoAutomovilCmb";
            this.TipoAutomovilCmb.Size = new System.Drawing.Size(341, 21);
            this.TipoAutomovilCmb.TabIndex = 3;
            this.TipoAutomovilCmb.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(128, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(114, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Seleccione una parte: ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(128, 112);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Seleccione un modelo:";
            // 
            // Ventana_Asociacion_Parte_Automovil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.TipoAutomovilCmb);
            this.Controls.Add(this.PartesCmb);
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.asociarBtn);
            this.Name = "Ventana_Asociacion_Parte_Automovil";
            this.Size = new System.Drawing.Size(393, 275);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button asociarBtn;
        private System.Windows.Forms.Button cancelarBtn;
        private System.Windows.Forms.ComboBox PartesCmb;
        private System.Windows.Forms.ComboBox TipoAutomovilCmb;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}
