namespace Proyecto1_BD1.View
{
    partial class LocalizarProveedor
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
            this.proveedorDataGridView = new System.Windows.Forms.DataGridView();
            this.aceptarBtn = new System.Windows.Forms.Button();
            this.limpiarBtn = new System.Windows.Forms.Button();
            this.cancelarBtn = new System.Windows.Forms.Button();
            this.nombreParteTxtBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.proveedorDataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // proveedorDataGridView
            // 
            this.proveedorDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.proveedorDataGridView.Location = new System.Drawing.Point(287, 26);
            this.proveedorDataGridView.Name = "proveedorDataGridView";
            this.proveedorDataGridView.Size = new System.Drawing.Size(282, 303);
            this.proveedorDataGridView.TabIndex = 0;
            // 
            // aceptarBtn
            // 
            this.aceptarBtn.Location = new System.Drawing.Point(19, 306);
            this.aceptarBtn.Name = "aceptarBtn";
            this.aceptarBtn.Size = new System.Drawing.Size(75, 23);
            this.aceptarBtn.TabIndex = 1;
            this.aceptarBtn.Text = "Aceptar";
            this.aceptarBtn.UseVisualStyleBackColor = true;
            // 
            // limpiarBtn
            // 
            this.limpiarBtn.Location = new System.Drawing.Point(125, 306);
            this.limpiarBtn.Name = "limpiarBtn";
            this.limpiarBtn.Size = new System.Drawing.Size(75, 23);
            this.limpiarBtn.TabIndex = 2;
            this.limpiarBtn.Text = "Limpiar";
            this.limpiarBtn.UseVisualStyleBackColor = true;
            this.limpiarBtn.Click += new System.EventHandler(this.limpiarBtn_Click);
            // 
            // cancelarBtn
            // 
            this.cancelarBtn.Location = new System.Drawing.Point(206, 306);
            this.cancelarBtn.Name = "cancelarBtn";
            this.cancelarBtn.Size = new System.Drawing.Size(75, 23);
            this.cancelarBtn.TabIndex = 3;
            this.cancelarBtn.Text = "Cancelar";
            this.cancelarBtn.UseVisualStyleBackColor = true;
            // 
            // nombreParteTxtBox
            // 
            this.nombreParteTxtBox.Location = new System.Drawing.Point(19, 67);
            this.nombreParteTxtBox.Name = "nombreParteTxtBox";
            this.nombreParteTxtBox.Size = new System.Drawing.Size(215, 20);
            this.nombreParteTxtBox.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Nombre de la parte";
            // 
            // LocalizarProveedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label1);
            this.Controls.Add(this.nombreParteTxtBox);
            this.Controls.Add(this.cancelarBtn);
            this.Controls.Add(this.limpiarBtn);
            this.Controls.Add(this.aceptarBtn);
            this.Controls.Add(this.proveedorDataGridView);
            this.Name = "LocalizarProveedor";
            this.Size = new System.Drawing.Size(582, 351);
            ((System.ComponentModel.ISupportInitialize)(this.proveedorDataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.DataGridView proveedorDataGridView;
        public System.Windows.Forms.Button aceptarBtn;
        private System.Windows.Forms.Button limpiarBtn;
        public System.Windows.Forms.Button cancelarBtn;
        public System.Windows.Forms.TextBox nombreParteTxtBox;
        private System.Windows.Forms.Label label1;
    }
}
