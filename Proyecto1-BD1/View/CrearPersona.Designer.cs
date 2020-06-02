namespace Proyecto1_BD1
{
    partial class CrearPersona
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
            this.label1 = new System.Windows.Forms.Label();
            this.nombreTxtBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.apellidosTxtBox = new System.Windows.Forms.TextBox();
            this.cedulaTxtBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.numeroTxtBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.direccionTxtBox = new System.Windows.Forms.TextBox();
            this.aceptarBtn = new System.Windows.Forms.Button();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.limpiarBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nombres";
            // 
            // nombreTxtBox
            // 
            this.nombreTxtBox.Location = new System.Drawing.Point(73, 24);
            this.nombreTxtBox.Name = "nombreTxtBox";
            this.nombreTxtBox.Size = new System.Drawing.Size(100, 20);
            this.nombreTxtBox.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(180, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Apellidos";
            // 
            // apellidosTxtBox
            // 
            this.apellidosTxtBox.Location = new System.Drawing.Point(235, 27);
            this.apellidosTxtBox.Name = "apellidosTxtBox";
            this.apellidosTxtBox.Size = new System.Drawing.Size(100, 20);
            this.apellidosTxtBox.TabIndex = 3;
            // 
            // cedulaTxtBox
            // 
            this.cedulaTxtBox.Location = new System.Drawing.Point(73, 75);
            this.cedulaTxtBox.Name = "cedulaTxtBox";
            this.cedulaTxtBox.Size = new System.Drawing.Size(100, 20);
            this.cedulaTxtBox.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(17, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Cedula";
            // 
            // numeroTxtBox
            // 
            this.numeroTxtBox.Location = new System.Drawing.Point(235, 75);
            this.numeroTxtBox.Name = "numeroTxtBox";
            this.numeroTxtBox.Size = new System.Drawing.Size(100, 20);
            this.numeroTxtBox.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(179, 75);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(44, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Numero";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(17, 118);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(52, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "Direccion";
            // 
            // direccionTxtBox
            // 
            this.direccionTxtBox.Location = new System.Drawing.Point(75, 118);
            this.direccionTxtBox.Multiline = true;
            this.direccionTxtBox.Name = "direccionTxtBox";
            this.direccionTxtBox.Size = new System.Drawing.Size(262, 97);
            this.direccionTxtBox.TabIndex = 9;
            // 
            // aceptarBtn
            // 
            this.aceptarBtn.Location = new System.Drawing.Point(73, 269);
            this.aceptarBtn.Name = "aceptarBtn";
            this.aceptarBtn.Size = new System.Drawing.Size(75, 23);
            this.aceptarBtn.TabIndex = 10;
            this.aceptarBtn.Text = "Aceptar";
            this.aceptarBtn.UseVisualStyleBackColor = true;
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(262, 269);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(75, 23);
            this.cancelarBtn.TabIndex = 11;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            // 
            // limpiarBtn
            // 
            this.limpiarBtn.Location = new System.Drawing.Point(181, 269);
            this.limpiarBtn.Name = "limpiarBtn";
            this.limpiarBtn.Size = new System.Drawing.Size(75, 23);
            this.limpiarBtn.TabIndex = 12;
            this.limpiarBtn.Text = "Limpiar";
            this.limpiarBtn.UseVisualStyleBackColor = true;
            this.limpiarBtn.Click += new System.EventHandler(this.limpiarBtn_Click);
            // 
            // CrearPersona
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.limpiarBtn);
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.aceptarBtn);
            this.Controls.Add(this.direccionTxtBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.numeroTxtBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cedulaTxtBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.apellidosTxtBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.nombreTxtBox);
            this.Controls.Add(this.label1);
            this.Name = "CrearPersona";
            this.Size = new System.Drawing.Size(374, 316);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox nombreTxtBox;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox apellidosTxtBox;
        public System.Windows.Forms.TextBox cedulaTxtBox;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox numeroTxtBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        public System.Windows.Forms.TextBox direccionTxtBox;
        public System.Windows.Forms.Button aceptarBtn;
        public System.Windows.Forms.Button cancelarBtn;
        private System.Windows.Forms.Button limpiarBtn;
    }
}
