namespace Proyecto1_BD1.View
{
    partial class VentanaMostrarOrdenes
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
            this.ordenesPersonasGrid = new System.Windows.Forms.DataGridView();
            this.NumeroConsecutivo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FechaEmision = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cedula = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MontoVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MontoIva = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MontoCobrado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ordenesOrganizacionesGrid = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.ordenesPersonasGrid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ordenesOrganizacionesGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // ordenesPersonasGrid
            // 
            this.ordenesPersonasGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ordenesPersonasGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ordenesPersonasGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.NumeroConsecutivo,
            this.FechaEmision,
            this.Cedula,
            this.Nombre,
            this.MontoVenta,
            this.MontoIva,
            this.MontoCobrado});
            this.ordenesPersonasGrid.Location = new System.Drawing.Point(23, 46);
            this.ordenesPersonasGrid.Name = "ordenesPersonasGrid";
            this.ordenesPersonasGrid.Size = new System.Drawing.Size(622, 188);
            this.ordenesPersonasGrid.TabIndex = 0;
            this.ordenesPersonasGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // NumeroConsecutivo
            // 
            this.NumeroConsecutivo.HeaderText = "Consecutivo";
            this.NumeroConsecutivo.Name = "NumeroConsecutivo";
            // 
            // FechaEmision
            // 
            this.FechaEmision.HeaderText = "Fecha Emitida";
            this.FechaEmision.Name = "FechaEmision";
            // 
            // Cedula
            // 
            this.Cedula.HeaderText = "Cedula";
            this.Cedula.Name = "Cedula";
            // 
            // Nombre
            // 
            this.Nombre.HeaderText = "Nombre";
            this.Nombre.Name = "Nombre";
            // 
            // MontoVenta
            // 
            this.MontoVenta.HeaderText = "Monto de Venta";
            this.MontoVenta.Name = "MontoVenta";
            // 
            // MontoIva
            // 
            this.MontoIva.HeaderText = "Monto IVA";
            this.MontoIva.Name = "MontoIva";
            // 
            // MontoCobrado
            // 
            this.MontoCobrado.HeaderText = "Monto Cobrado";
            this.MontoCobrado.Name = "MontoCobrado";
            // 
            // ordenesOrganizacionesGrid
            // 
            this.ordenesOrganizacionesGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ordenesOrganizacionesGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ordenesOrganizacionesGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn4,
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6,
            this.dataGridViewTextBoxColumn7});
            this.ordenesOrganizacionesGrid.Location = new System.Drawing.Point(23, 286);
            this.ordenesOrganizacionesGrid.Name = "ordenesOrganizacionesGrid";
            this.ordenesOrganizacionesGrid.Size = new System.Drawing.Size(622, 190);
            this.ordenesOrganizacionesGrid.TabIndex = 1;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.HeaderText = "Consecutivo";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.HeaderText = "Fecha Emitida";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.HeaderText = "Cedula";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.HeaderText = "Nombre";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.HeaderText = "Monto de Venta";
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.HeaderText = "Monto IVA";
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            // 
            // dataGridViewTextBoxColumn7
            // 
            this.dataGridViewTextBoxColumn7.HeaderText = "Monto Cobrado";
            this.dataGridViewTextBoxColumn7.Name = "dataGridViewTextBoxColumn7";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(296, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Personas";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(281, 255);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(80, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Organizaciones";
            // 
            // VentanaMostrarOrdenes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.ordenesOrganizacionesGrid);
            this.Controls.Add(this.ordenesPersonasGrid);
            this.Name = "VentanaMostrarOrdenes";
            this.Size = new System.Drawing.Size(668, 488);
            ((System.ComponentModel.ISupportInitialize)(this.ordenesPersonasGrid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ordenesOrganizacionesGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.DataGridView ordenesPersonasGrid;
        private System.Windows.Forms.DataGridViewTextBoxColumn NumeroConsecutivo;
        private System.Windows.Forms.DataGridViewTextBoxColumn FechaEmision;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cedula;
        private System.Windows.Forms.DataGridViewTextBoxColumn Nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn MontoVenta;
        private System.Windows.Forms.DataGridViewTextBoxColumn MontoIva;
        private System.Windows.Forms.DataGridViewTextBoxColumn MontoCobrado;
        public System.Windows.Forms.DataGridView ordenesOrganizacionesGrid;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn7;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}
