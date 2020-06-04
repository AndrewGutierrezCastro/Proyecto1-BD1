namespace Proyecto1_BD1.View
{
    partial class CrearOrden
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
            this.isOrganizacionCheckBox = new System.Windows.Forms.CheckBox();
            this.limpiarBtn = new System.Windows.Forms.Button();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.aceptarBtn = new System.Windows.Forms.Button();
            this.cedulaTxtBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dateTimePck = new System.Windows.Forms.DateTimePicker();
            this.SuspendLayout();
            // 
            // isOrganizacionCheckBox
            // 
            this.isOrganizacionCheckBox.AutoSize = true;
            this.isOrganizacionCheckBox.Location = new System.Drawing.Point(219, 84);
            this.isOrganizacionCheckBox.Name = "isOrganizacionCheckBox";
            this.isOrganizacionCheckBox.Size = new System.Drawing.Size(88, 17);
            this.isOrganizacionCheckBox.TabIndex = 43;
            this.isOrganizacionCheckBox.Text = "Organizacion";
            this.isOrganizacionCheckBox.UseVisualStyleBackColor = true;
            // 
            // limpiarBtn
            // 
            this.limpiarBtn.Location = new System.Drawing.Point(138, 146);
            this.limpiarBtn.Name = "limpiarBtn";
            this.limpiarBtn.Size = new System.Drawing.Size(75, 23);
            this.limpiarBtn.TabIndex = 42;
            this.limpiarBtn.Text = "Limpiar";
            this.limpiarBtn.UseVisualStyleBackColor = true;
            this.limpiarBtn.Click += new System.EventHandler(this.limpiarBtn_Click);
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(219, 146);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(75, 23);
            this.cancelarBtn.TabIndex = 41;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            // 
            // aceptarBtn
            // 
            this.aceptarBtn.Location = new System.Drawing.Point(30, 146);
            this.aceptarBtn.Name = "aceptarBtn";
            this.aceptarBtn.Size = new System.Drawing.Size(75, 23);
            this.aceptarBtn.TabIndex = 40;
            this.aceptarBtn.Text = "Aceptar";
            this.aceptarBtn.UseVisualStyleBackColor = true;
            // 
            // cedulaTxtBox
            // 
            this.cedulaTxtBox.Location = new System.Drawing.Point(83, 81);
            this.cedulaTxtBox.Name = "cedulaTxtBox";
            this.cedulaTxtBox.Size = new System.Drawing.Size(116, 20);
            this.cedulaTxtBox.TabIndex = 39;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(27, 81);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 38;
            this.label3.Text = "Cedula";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(30, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(37, 13);
            this.label1.TabIndex = 44;
            this.label1.Text = "Fecha";
            // 
            // dateTimePck
            // 
            this.dateTimePck.Location = new System.Drawing.Point(83, 39);
            this.dateTimePck.Name = "dateTimePck";
            this.dateTimePck.Size = new System.Drawing.Size(211, 20);
            this.dateTimePck.TabIndex = 45;
            // 
            // CrearOrden
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dateTimePck);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.isOrganizacionCheckBox);
            this.Controls.Add(this.limpiarBtn);
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.aceptarBtn);
            this.Controls.Add(this.cedulaTxtBox);
            this.Controls.Add(this.label3);
            this.Name = "CrearOrden";
            this.Size = new System.Drawing.Size(320, 190);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.CheckBox isOrganizacionCheckBox;
        private System.Windows.Forms.Button limpiarBtn;
        public System.Windows.Forms.Button cancelarBtn;
        public System.Windows.Forms.Button aceptarBtn;
        public System.Windows.Forms.TextBox cedulaTxtBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.DateTimePicker dateTimePck;
    }
}
