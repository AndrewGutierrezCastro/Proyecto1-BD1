namespace Proyecto1_BD1.View
{
    partial class CambiarEstadoCliente
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

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.estadoCmbBox = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cedulaTxtBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.limpiarBtn = new System.Windows.Forms.Button();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.aceptarBtn = new System.Windows.Forms.Button();
            this.isOrganizacionCheckBox = new System.Windows.Forms.CheckBox();
            this.SuspendLayout();
            // 
            // estadoCmbBox
            // 
            this.estadoCmbBox.FormattingEnabled = true;
            this.estadoCmbBox.Items.AddRange(new object[] {
            "ACTIVO",
            "INACTIVO",
            "SUSPENDIDO"});
            this.estadoCmbBox.Location = new System.Drawing.Point(69, 29);
            this.estadoCmbBox.Name = "estadoCmbBox";
            this.estadoCmbBox.Size = new System.Drawing.Size(116, 21);
            this.estadoCmbBox.TabIndex = 29;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(13, 29);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(40, 13);
            this.label6.TabIndex = 28;
            this.label6.Text = "Estado";
            // 
            // cedulaTxtBox
            // 
            this.cedulaTxtBox.Location = new System.Drawing.Point(69, 67);
            this.cedulaTxtBox.Name = "cedulaTxtBox";
            this.cedulaTxtBox.Size = new System.Drawing.Size(116, 20);
            this.cedulaTxtBox.TabIndex = 31;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 67);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 30;
            this.label3.Text = "Cedula";
            // 
            // limpiarBtn
            // 
            this.limpiarBtn.Location = new System.Drawing.Point(124, 132);
            this.limpiarBtn.Name = "limpiarBtn";
            this.limpiarBtn.Size = new System.Drawing.Size(75, 23);
            this.limpiarBtn.TabIndex = 34;
            this.limpiarBtn.Text = "Limpiar";
            this.limpiarBtn.UseVisualStyleBackColor = true;
            this.limpiarBtn.Click += new System.EventHandler(this.limpiarBtn_Click);
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(205, 132);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(75, 23);
            this.cancelarBtn.TabIndex = 33;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            // 
            // aceptarBtn
            // 
            this.aceptarBtn.Location = new System.Drawing.Point(16, 132);
            this.aceptarBtn.Name = "aceptarBtn";
            this.aceptarBtn.Size = new System.Drawing.Size(75, 23);
            this.aceptarBtn.TabIndex = 32;
            this.aceptarBtn.Text = "Aceptar";
            this.aceptarBtn.UseVisualStyleBackColor = true;
            // 
            // isOrganizacionCheckBox
            // 
            this.isOrganizacionCheckBox.AutoSize = true;
            this.isOrganizacionCheckBox.Location = new System.Drawing.Point(196, 31);
            this.isOrganizacionCheckBox.Name = "isOrganizacionCheckBox";
            this.isOrganizacionCheckBox.Size = new System.Drawing.Size(88, 17);
            this.isOrganizacionCheckBox.TabIndex = 35;
            this.isOrganizacionCheckBox.Text = "Organizacion";
            this.isOrganizacionCheckBox.UseVisualStyleBackColor = true;
            // 
            // CambiarEstadoCliente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.isOrganizacionCheckBox);
            this.Controls.Add(this.limpiarBtn);
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.aceptarBtn);
            this.Controls.Add(this.cedulaTxtBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.estadoCmbBox);
            this.Controls.Add(this.label6);
            this.Name = "CambiarEstadoCliente";
            this.Size = new System.Drawing.Size(287, 167);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox estadoCmbBox;
        private System.Windows.Forms.Label label6;
        public System.Windows.Forms.TextBox cedulaTxtBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button limpiarBtn;
        public System.Windows.Forms.Button cancelarBtn;
        public System.Windows.Forms.Button aceptarBtn;
        public System.Windows.Forms.CheckBox isOrganizacionCheckBox;
    }
}
