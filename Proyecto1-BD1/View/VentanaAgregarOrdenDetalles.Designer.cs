namespace Proyecto1_BD1.View
{
    partial class VentanaAgregarOrdenDetalles
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
            this.ordenCmb = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.ordenDetalleGrid = new System.Windows.Forms.DataGridView();
            this.NombreParte = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Proveedor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MontoVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrecioCobrado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.parteOrdenCmb = new System.Windows.Forms.ComboBox();
            this.cantidadTxt = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.agregarOrdenDetalleBtn = new System.Windows.Forms.Button();
            this.montoIvaTxt = new System.Windows.Forms.TextBox();
            this.totalTXT = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.registrarOrdenBtn = new System.Windows.Forms.Button();
            this.cancelarOrdenDetalleBtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.ordenDetalleGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // ordenCmb
            // 
            this.ordenCmb.FormattingEnabled = true;
            this.ordenCmb.Location = new System.Drawing.Point(12, 36);
            this.ordenCmb.Name = "ordenCmb";
            this.ordenCmb.Size = new System.Drawing.Size(205, 21);
            this.ordenCmb.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Seleccione la orden";
            // 
            // ordenDetalleGrid
            // 
            this.ordenDetalleGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ordenDetalleGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ordenDetalleGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.NombreParte,
            this.Proveedor,
            this.Cantidad,
            this.MontoVenta,
            this.PrecioCobrado});
            this.ordenDetalleGrid.Location = new System.Drawing.Point(232, 3);
            this.ordenDetalleGrid.Name = "ordenDetalleGrid";
            this.ordenDetalleGrid.Size = new System.Drawing.Size(513, 510);
            this.ordenDetalleGrid.TabIndex = 2;
            this.ordenDetalleGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.ordenDetalleGrid_CellContentClick);
            // 
            // NombreParte
            // 
            this.NombreParte.HeaderText = "Parte";
            this.NombreParte.Name = "NombreParte";
            // 
            // Proveedor
            // 
            this.Proveedor.HeaderText = "Proveedor";
            this.Proveedor.Name = "Proveedor";
            // 
            // Cantidad
            // 
            this.Cantidad.HeaderText = "Cantidad";
            this.Cantidad.Name = "Cantidad";
            // 
            // MontoVenta
            // 
            this.MontoVenta.HeaderText = "Monto de Venta";
            this.MontoVenta.Name = "MontoVenta";
            // 
            // PrecioCobrado
            // 
            this.PrecioCobrado.HeaderText = "Precio Cobrado";
            this.PrecioCobrado.Name = "PrecioCobrado";
            // 
            // parteOrdenCmb
            // 
            this.parteOrdenCmb.FormattingEnabled = true;
            this.parteOrdenCmb.Location = new System.Drawing.Point(12, 110);
            this.parteOrdenCmb.Name = "parteOrdenCmb";
            this.parteOrdenCmb.Size = new System.Drawing.Size(205, 21);
            this.parteOrdenCmb.TabIndex = 3;
            this.parteOrdenCmb.SelectedIndexChanged += new System.EventHandler(this.parteOrdenCmb_SelectedIndexChanged);
            // 
            // cantidadTxt
            // 
            this.cantidadTxt.Location = new System.Drawing.Point(12, 176);
            this.cantidadTxt.Name = "cantidadTxt";
            this.cantidadTxt.Size = new System.Drawing.Size(205, 20);
            this.cantidadTxt.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 94);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(98, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Seleccione la parte";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 160);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(49, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Cantidad";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // agregarOrdenDetalleBtn
            // 
            this.agregarOrdenDetalleBtn.Location = new System.Drawing.Point(12, 212);
            this.agregarOrdenDetalleBtn.Name = "agregarOrdenDetalleBtn";
            this.agregarOrdenDetalleBtn.Size = new System.Drawing.Size(205, 23);
            this.agregarOrdenDetalleBtn.TabIndex = 7;
            this.agregarOrdenDetalleBtn.Text = "Agregar";
            this.agregarOrdenDetalleBtn.UseVisualStyleBackColor = true;
            this.agregarOrdenDetalleBtn.Click += new System.EventHandler(this.agregarOrdenDetalleBtn_Click);
            // 
            // montoIvaTxt
            // 
            this.montoIvaTxt.Location = new System.Drawing.Point(12, 284);
            this.montoIvaTxt.Name = "montoIvaTxt";
            this.montoIvaTxt.Size = new System.Drawing.Size(205, 20);
            this.montoIvaTxt.TabIndex = 8;
            this.montoIvaTxt.TextChanged += new System.EventHandler(this.montoIvaTxt_TextChanged);
            // 
            // totalTXT
            // 
            this.totalTXT.Enabled = false;
            this.totalTXT.Location = new System.Drawing.Point(12, 334);
            this.totalTXT.Name = "totalTXT";
            this.totalTXT.Size = new System.Drawing.Size(205, 20);
            this.totalTXT.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 268);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(57, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "Monto IVA";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(9, 318);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(31, 13);
            this.label5.TabIndex = 12;
            this.label5.Text = "Total";
            // 
            // registrarOrdenBtn
            // 
            this.registrarOrdenBtn.Location = new System.Drawing.Point(12, 369);
            this.registrarOrdenBtn.Name = "registrarOrdenBtn";
            this.registrarOrdenBtn.Size = new System.Drawing.Size(205, 46);
            this.registrarOrdenBtn.TabIndex = 13;
            this.registrarOrdenBtn.Text = "Registrar Orden";
            this.registrarOrdenBtn.UseVisualStyleBackColor = true;
            this.registrarOrdenBtn.Click += new System.EventHandler(this.registrarOrdenBtn_Click);
            // 
            // cancelarOrdenDetalleBtn
            // 
            this.cancelarOrdenDetalleBtn.Location = new System.Drawing.Point(15, 421);
            this.cancelarOrdenDetalleBtn.Name = "cancelarOrdenDetalleBtn";
            this.cancelarOrdenDetalleBtn.Size = new System.Drawing.Size(205, 23);
            this.cancelarOrdenDetalleBtn.TabIndex = 14;
            this.cancelarOrdenDetalleBtn.Text = "Cancelar";
            this.cancelarOrdenDetalleBtn.UseVisualStyleBackColor = true;
            this.cancelarOrdenDetalleBtn.Click += new System.EventHandler(this.cancelarOrdenDetalleBtn_Click);
            // 
            // VentanaAgregarOrdenDetalles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cancelarOrdenDetalleBtn);
            this.Controls.Add(this.registrarOrdenBtn);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.totalTXT);
            this.Controls.Add(this.montoIvaTxt);
            this.Controls.Add(this.agregarOrdenDetalleBtn);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cantidadTxt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.parteOrdenCmb);
            this.Controls.Add(this.ordenDetalleGrid);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.ordenCmb);
            this.Name = "VentanaAgregarOrdenDetalles";
            this.Size = new System.Drawing.Size(764, 530);
            ((System.ComponentModel.ISupportInitialize)(this.ordenDetalleGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox ordenCmb;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.DataGridView ordenDetalleGrid;
        public System.Windows.Forms.DataGridViewTextBoxColumn NombreParte;
        public System.Windows.Forms.DataGridViewTextBoxColumn Proveedor;
        public System.Windows.Forms.DataGridViewTextBoxColumn Cantidad;
        public System.Windows.Forms.DataGridViewTextBoxColumn MontoVenta;
        public System.Windows.Forms.DataGridViewTextBoxColumn PrecioCobrado;
        public System.Windows.Forms.ComboBox parteOrdenCmb;
        public System.Windows.Forms.TextBox cantidadTxt;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.Button agregarOrdenDetalleBtn;
        private System.Windows.Forms.TextBox montoIvaTxt;
        public System.Windows.Forms.TextBox totalTXT;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        public System.Windows.Forms.Button registrarOrdenBtn;
        public System.Windows.Forms.Button cancelarOrdenDetalleBtn;
    }
}
