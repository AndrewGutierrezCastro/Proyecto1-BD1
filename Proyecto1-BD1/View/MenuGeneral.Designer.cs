namespace Proyecto1_BD1
{
    partial class MenuGeneral
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cerrarConexionBtn = new System.Windows.Forms.Button();
            this.pestañas = new System.Windows.Forms.TabControl();
            this.clientesTab = new System.Windows.Forms.TabPage();
            this.panelClientesAux = new System.Windows.Forms.Panel();
            this.clientesTabControl = new System.Windows.Forms.TabControl();
            this.personasTab = new System.Windows.Forms.TabPage();
            this.organizacionesTab = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.listarClientesBtn = new System.Windows.Forms.Button();
            this.cambiarEstadoCLienteBtn = new System.Windows.Forms.Button();
            this.modificarClienteBtn = new System.Windows.Forms.Button();
            this.insertarClienteBtn = new System.Windows.Forms.Button();
            this.partesTab = new System.Windows.Forms.TabPage();
            this.ProveedorPartesTab = new System.Windows.Forms.TabControl();
            this.Partes_SubTab = new System.Windows.Forms.TabPage();
            this.Partes_dataGridView = new System.Windows.Forms.DataGridView();
            this.NombreClm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MarcaClm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FabricanteClm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AutomovilClm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label1 = new System.Windows.Forms.Label();
            this.proveedorCmb = new System.Windows.Forms.ComboBox();
            this.partesxproveedor_dataGridView = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProveedorClm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AutomovilPartesTab = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            this.automovilCmb = new System.Windows.Forms.ComboBox();
            this.partesxautomovil_dataGridView = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn8 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Proveedor_Clm = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel3 = new System.Windows.Forms.Panel();
            this.listarPartesBtn = new System.Windows.Forms.Button();
            this.actualizarPreciosParteProveedorBtn = new System.Windows.Forms.Button();
            this.asociarParteAutomovil = new System.Windows.Forms.Button();
            this.asociarParteProveedorBtn = new System.Windows.Forms.Button();
            this.borrarParteBtn = new System.Windows.Forms.Button();
            this.insertarParteBtn = new System.Windows.Forms.Button();
            this.OrdenesTab = new System.Windows.Forms.TabPage();
            this.panel4 = new System.Windows.Forms.Panel();
            this.listaPersonasGrid = new System.Windows.Forms.DataGridView();
            this.listaOrganizacionesGrid = new System.Windows.Forms.DataGridView();
            this.pestañas.SuspendLayout();
            this.clientesTab.SuspendLayout();
            this.panelClientesAux.SuspendLayout();
            this.clientesTabControl.SuspendLayout();
            this.panel1.SuspendLayout();
            this.partesTab.SuspendLayout();
            this.ProveedorPartesTab.SuspendLayout();
            this.Partes_SubTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Partes_dataGridView)).BeginInit();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.partesxproveedor_dataGridView)).BeginInit();
            this.AutomovilPartesTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.partesxautomovil_dataGridView)).BeginInit();
            this.panel3.SuspendLayout();
            this.OrdenesTab.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.listaPersonasGrid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.listaOrganizacionesGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // cerrarConexionBtn
            // 
            this.cerrarConexionBtn.Location = new System.Drawing.Point(631, 475);
            this.cerrarConexionBtn.Name = "cerrarConexionBtn";
            this.cerrarConexionBtn.Size = new System.Drawing.Size(137, 24);
            this.cerrarConexionBtn.TabIndex = 0;
            this.cerrarConexionBtn.Text = "Cerrar la conexion";
            this.cerrarConexionBtn.UseVisualStyleBackColor = true;
            this.cerrarConexionBtn.Click += new System.EventHandler(this.cerrarConexionBtn_Click);
            // 
            // pestañas
            // 
            this.pestañas.Controls.Add(this.clientesTab);
            this.pestañas.Controls.Add(this.partesTab);
            this.pestañas.Controls.Add(this.OrdenesTab);
            this.pestañas.Location = new System.Drawing.Point(13, 13);
            this.pestañas.Name = "pestañas";
            this.pestañas.SelectedIndex = 0;
            this.pestañas.Size = new System.Drawing.Size(772, 456);
            this.pestañas.TabIndex = 1;
            // 
            // clientesTab
            // 
            this.clientesTab.Controls.Add(this.panelClientesAux);
            this.clientesTab.Controls.Add(this.panel1);
            this.clientesTab.Location = new System.Drawing.Point(4, 22);
            this.clientesTab.Name = "clientesTab";
            this.clientesTab.Padding = new System.Windows.Forms.Padding(3);
            this.clientesTab.Size = new System.Drawing.Size(764, 430);
            this.clientesTab.TabIndex = 0;
            this.clientesTab.Text = "Clientes";
            this.clientesTab.UseVisualStyleBackColor = true;
            // 
            // panelClientesAux
            // 
            this.panelClientesAux.AutoSize = true;
            this.panelClientesAux.Controls.Add(this.clientesTabControl);
            this.panelClientesAux.Location = new System.Drawing.Point(149, 0);
            this.panelClientesAux.Name = "panelClientesAux";
            this.panelClientesAux.Size = new System.Drawing.Size(609, 424);
            this.panelClientesAux.TabIndex = 1;
            // 
            // clientesTabControl
            // 
            this.clientesTabControl.Controls.Add(this.personasTab);
            this.clientesTabControl.Controls.Add(this.organizacionesTab);
            this.clientesTabControl.Location = new System.Drawing.Point(5, 3);
            this.clientesTabControl.Name = "clientesTabControl";
            this.clientesTabControl.SelectedIndex = 0;
            this.clientesTabControl.Size = new System.Drawing.Size(597, 401);
            this.clientesTabControl.TabIndex = 0;
            // 
            // personasTab
            // 
            this.personasTab.Location = new System.Drawing.Point(4, 22);
            this.personasTab.Name = "personasTab";
            this.personasTab.Padding = new System.Windows.Forms.Padding(3);
            this.personasTab.Size = new System.Drawing.Size(589, 375);
            this.personasTab.TabIndex = 0;
            this.personasTab.Text = "Personas";
            this.personasTab.UseVisualStyleBackColor = true;
            // 
            // organizacionesTab
            // 
            this.organizacionesTab.AutoScroll = true;
            this.organizacionesTab.Location = new System.Drawing.Point(4, 22);
            this.organizacionesTab.Name = "organizacionesTab";
            this.organizacionesTab.Padding = new System.Windows.Forms.Padding(3);
            this.organizacionesTab.Size = new System.Drawing.Size(589, 375);
            this.organizacionesTab.TabIndex = 1;
            this.organizacionesTab.Text = "Organizaciones";
            this.organizacionesTab.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listarClientesBtn);
            this.panel1.Controls.Add(this.cambiarEstadoCLienteBtn);
            this.panel1.Controls.Add(this.modificarClienteBtn);
            this.panel1.Controls.Add(this.insertarClienteBtn);
            this.panel1.Location = new System.Drawing.Point(7, 7);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(138, 175);
            this.panel1.TabIndex = 0;
            // 
            // listarClientesBtn
            // 
            this.listarClientesBtn.Location = new System.Drawing.Point(3, 143);
            this.listarClientesBtn.Name = "listarClientesBtn";
            this.listarClientesBtn.Size = new System.Drawing.Size(126, 24);
            this.listarClientesBtn.TabIndex = 7;
            this.listarClientesBtn.Text = "Listar Clientes";
            this.listarClientesBtn.UseVisualStyleBackColor = true;
            this.listarClientesBtn.Click += new System.EventHandler(this.listarClientesBtn_Click);
            // 
            // cambiarEstadoCLienteBtn
            // 
            this.cambiarEstadoCLienteBtn.Location = new System.Drawing.Point(3, 100);
            this.cambiarEstadoCLienteBtn.Name = "cambiarEstadoCLienteBtn";
            this.cambiarEstadoCLienteBtn.Size = new System.Drawing.Size(126, 24);
            this.cambiarEstadoCLienteBtn.TabIndex = 6;
            this.cambiarEstadoCLienteBtn.Text = "Cambiar Estado Cliente";
            this.cambiarEstadoCLienteBtn.UseVisualStyleBackColor = true;
            // 
            // modificarClienteBtn
            // 
            this.modificarClienteBtn.Location = new System.Drawing.Point(3, 50);
            this.modificarClienteBtn.Name = "modificarClienteBtn";
            this.modificarClienteBtn.Size = new System.Drawing.Size(126, 24);
            this.modificarClienteBtn.TabIndex = 5;
            this.modificarClienteBtn.Text = "Modificar Cliente";
            this.modificarClienteBtn.UseVisualStyleBackColor = true;
            // 
            // insertarClienteBtn
            // 
            this.insertarClienteBtn.Location = new System.Drawing.Point(3, 4);
            this.insertarClienteBtn.Name = "insertarClienteBtn";
            this.insertarClienteBtn.Size = new System.Drawing.Size(126, 24);
            this.insertarClienteBtn.TabIndex = 4;
            this.insertarClienteBtn.Text = "Insertar Cliente";
            this.insertarClienteBtn.UseVisualStyleBackColor = true;
            this.insertarClienteBtn.Click += new System.EventHandler(this.insertarClienteBtn_Click);
            // 
            // partesTab
            // 
            this.partesTab.Controls.Add(this.ProveedorPartesTab);
            this.partesTab.Controls.Add(this.panel3);
            this.partesTab.Location = new System.Drawing.Point(4, 22);
            this.partesTab.Name = "partesTab";
            this.partesTab.Padding = new System.Windows.Forms.Padding(3);
            this.partesTab.Size = new System.Drawing.Size(764, 430);
            this.partesTab.TabIndex = 1;
            this.partesTab.Text = "Partes";
            this.partesTab.UseVisualStyleBackColor = true;
            // 
            // ProveedorPartesTab
            // 
            this.ProveedorPartesTab.Controls.Add(this.Partes_SubTab);
            this.ProveedorPartesTab.Controls.Add(this.tabPage2);
            this.ProveedorPartesTab.Controls.Add(this.AutomovilPartesTab);
            this.ProveedorPartesTab.Location = new System.Drawing.Point(161, 7);
            this.ProveedorPartesTab.Name = "ProveedorPartesTab";
            this.ProveedorPartesTab.SelectedIndex = 0;
            this.ProveedorPartesTab.Size = new System.Drawing.Size(597, 417);
            this.ProveedorPartesTab.TabIndex = 1;
            // 
            // Partes_SubTab
            // 
            this.Partes_SubTab.Controls.Add(this.Partes_dataGridView);
            this.Partes_SubTab.Location = new System.Drawing.Point(4, 22);
            this.Partes_SubTab.Name = "Partes_SubTab";
            this.Partes_SubTab.Padding = new System.Windows.Forms.Padding(3);
            this.Partes_SubTab.Size = new System.Drawing.Size(589, 391);
            this.Partes_SubTab.TabIndex = 0;
            this.Partes_SubTab.Text = "Tabla de Partes";
            this.Partes_SubTab.UseVisualStyleBackColor = true;
            // 
            // Partes_dataGridView
            // 
            this.Partes_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Partes_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.NombreClm,
            this.MarcaClm,
            this.FabricanteClm,
            this.AutomovilClm});
            this.Partes_dataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Partes_dataGridView.Location = new System.Drawing.Point(3, 3);
            this.Partes_dataGridView.Name = "Partes_dataGridView";
            this.Partes_dataGridView.Size = new System.Drawing.Size(583, 385);
            this.Partes_dataGridView.TabIndex = 0;
            this.Partes_dataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Partes_dataGridView_CellContentClick);
            // 
            // NombreClm
            // 
            this.NombreClm.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.NombreClm.HeaderText = "Nombre";
            this.NombreClm.Name = "NombreClm";
            // 
            // MarcaClm
            // 
            this.MarcaClm.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.MarcaClm.HeaderText = "Marca";
            this.MarcaClm.Name = "MarcaClm";
            // 
            // FabricanteClm
            // 
            this.FabricanteClm.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.FabricanteClm.HeaderText = "Fabricante";
            this.FabricanteClm.Name = "FabricanteClm";
            // 
            // AutomovilClm
            // 
            this.AutomovilClm.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.AutomovilClm.HeaderText = "Automovil";
            this.AutomovilClm.Name = "AutomovilClm";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.label1);
            this.tabPage2.Controls.Add(this.proveedorCmb);
            this.tabPage2.Controls.Add(this.partesxproveedor_dataGridView);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(589, 391);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Partes por Proveedor";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(267, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(92, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Elija un proveedor";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // proveedorCmb
            // 
            this.proveedorCmb.FormattingEnabled = true;
            this.proveedorCmb.Location = new System.Drawing.Point(365, 11);
            this.proveedorCmb.Name = "proveedorCmb";
            this.proveedorCmb.Size = new System.Drawing.Size(218, 21);
            this.proveedorCmb.TabIndex = 2;
            // 
            // partesxproveedor_dataGridView
            // 
            this.partesxproveedor_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.partesxproveedor_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn4,
            this.ProveedorClm});
            this.partesxproveedor_dataGridView.Location = new System.Drawing.Point(3, 38);
            this.partesxproveedor_dataGridView.Name = "partesxproveedor_dataGridView";
            this.partesxproveedor_dataGridView.Size = new System.Drawing.Size(583, 350);
            this.partesxproveedor_dataGridView.TabIndex = 1;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn1.HeaderText = "Nombre";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn2.HeaderText = "Marca";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn3.HeaderText = "Fabricante";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn4.HeaderText = "Automovil";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // ProveedorClm
            // 
            this.ProveedorClm.HeaderText = "Proveedor";
            this.ProveedorClm.Name = "ProveedorClm";
            // 
            // AutomovilPartesTab
            // 
            this.AutomovilPartesTab.Controls.Add(this.label2);
            this.AutomovilPartesTab.Controls.Add(this.automovilCmb);
            this.AutomovilPartesTab.Controls.Add(this.partesxautomovil_dataGridView);
            this.AutomovilPartesTab.Location = new System.Drawing.Point(4, 22);
            this.AutomovilPartesTab.Name = "AutomovilPartesTab";
            this.AutomovilPartesTab.Padding = new System.Windows.Forms.Padding(3);
            this.AutomovilPartesTab.Size = new System.Drawing.Size(589, 391);
            this.AutomovilPartesTab.TabIndex = 2;
            this.AutomovilPartesTab.Text = "Partes Por Automovil";
            this.AutomovilPartesTab.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(236, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(124, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Elija un tipo de automovil";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // automovilCmb
            // 
            this.automovilCmb.FormattingEnabled = true;
            this.automovilCmb.Location = new System.Drawing.Point(366, 12);
            this.automovilCmb.Name = "automovilCmb";
            this.automovilCmb.Size = new System.Drawing.Size(205, 21);
            this.automovilCmb.TabIndex = 5;
            this.automovilCmb.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // partesxautomovil_dataGridView
            // 
            this.partesxautomovil_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.partesxautomovil_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6,
            this.dataGridViewTextBoxColumn7,
            this.dataGridViewTextBoxColumn8,
            this.Proveedor_Clm});
            this.partesxautomovil_dataGridView.Location = new System.Drawing.Point(4, 39);
            this.partesxautomovil_dataGridView.Name = "partesxautomovil_dataGridView";
            this.partesxautomovil_dataGridView.Size = new System.Drawing.Size(580, 349);
            this.partesxautomovil_dataGridView.TabIndex = 4;
            this.partesxautomovil_dataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn5.HeaderText = "Nombre";
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn6.HeaderText = "Marca";
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            // 
            // dataGridViewTextBoxColumn7
            // 
            this.dataGridViewTextBoxColumn7.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn7.HeaderText = "Fabricante";
            this.dataGridViewTextBoxColumn7.Name = "dataGridViewTextBoxColumn7";
            // 
            // dataGridViewTextBoxColumn8
            // 
            this.dataGridViewTextBoxColumn8.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.dataGridViewTextBoxColumn8.HeaderText = "Automovil";
            this.dataGridViewTextBoxColumn8.Name = "dataGridViewTextBoxColumn8";
            // 
            // Proveedor_Clm
            // 
            this.Proveedor_Clm.HeaderText = "Proveedor";
            this.Proveedor_Clm.Name = "Proveedor_Clm";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.listarPartesBtn);
            this.panel3.Controls.Add(this.actualizarPreciosParteProveedorBtn);
            this.panel3.Controls.Add(this.asociarParteAutomovil);
            this.panel3.Controls.Add(this.asociarParteProveedorBtn);
            this.panel3.Controls.Add(this.borrarParteBtn);
            this.panel3.Controls.Add(this.insertarParteBtn);
            this.panel3.Location = new System.Drawing.Point(6, 6);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(149, 362);
            this.panel3.TabIndex = 0;
            // 
            // listarPartesBtn
            // 
            this.listarPartesBtn.Location = new System.Drawing.Point(14, 310);
            this.listarPartesBtn.Name = "listarPartesBtn";
            this.listarPartesBtn.Size = new System.Drawing.Size(121, 41);
            this.listarPartesBtn.TabIndex = 11;
            this.listarPartesBtn.Text = "Listar partes: modelo y año de manufactura";
            this.listarPartesBtn.UseVisualStyleBackColor = true;
            // 
            // actualizarPreciosParteProveedorBtn
            // 
            this.actualizarPreciosParteProveedorBtn.Location = new System.Drawing.Point(14, 246);
            this.actualizarPreciosParteProveedorBtn.Name = "actualizarPreciosParteProveedorBtn";
            this.actualizarPreciosParteProveedorBtn.Size = new System.Drawing.Size(121, 58);
            this.actualizarPreciosParteProveedorBtn.TabIndex = 10;
            this.actualizarPreciosParteProveedorBtn.Text = "Actualizar precios de parte de un proveedor";
            this.actualizarPreciosParteProveedorBtn.UseVisualStyleBackColor = true;
            // 
            // asociarParteAutomovil
            // 
            this.asociarParteAutomovil.Location = new System.Drawing.Point(14, 148);
            this.asociarParteAutomovil.Name = "asociarParteAutomovil";
            this.asociarParteAutomovil.Size = new System.Drawing.Size(121, 37);
            this.asociarParteAutomovil.TabIndex = 9;
            this.asociarParteAutomovil.Text = "Asociar Parte - Automovil";
            this.asociarParteAutomovil.UseVisualStyleBackColor = true;
            // 
            // asociarParteProveedorBtn
            // 
            this.asociarParteProveedorBtn.Location = new System.Drawing.Point(14, 92);
            this.asociarParteProveedorBtn.Name = "asociarParteProveedorBtn";
            this.asociarParteProveedorBtn.Size = new System.Drawing.Size(121, 37);
            this.asociarParteProveedorBtn.TabIndex = 8;
            this.asociarParteProveedorBtn.Text = "Asociar Parte - Proveedor";
            this.asociarParteProveedorBtn.UseVisualStyleBackColor = true;
            // 
            // borrarParteBtn
            // 
            this.borrarParteBtn.Location = new System.Drawing.Point(14, 47);
            this.borrarParteBtn.Name = "borrarParteBtn";
            this.borrarParteBtn.Size = new System.Drawing.Size(121, 24);
            this.borrarParteBtn.TabIndex = 7;
            this.borrarParteBtn.Text = "Borrar Parte";
            this.borrarParteBtn.UseVisualStyleBackColor = true;
            this.borrarParteBtn.Click += new System.EventHandler(this.borrarParteBtn_Click);
            // 
            // insertarParteBtn
            // 
            this.insertarParteBtn.Location = new System.Drawing.Point(14, 17);
            this.insertarParteBtn.Name = "insertarParteBtn";
            this.insertarParteBtn.Size = new System.Drawing.Size(121, 24);
            this.insertarParteBtn.TabIndex = 6;
            this.insertarParteBtn.Text = "Insertar Parte";
            this.insertarParteBtn.UseVisualStyleBackColor = true;
            // 
            // OrdenesTab
            // 
            this.OrdenesTab.Controls.Add(this.panel4);
            this.OrdenesTab.Location = new System.Drawing.Point(4, 22);
            this.OrdenesTab.Name = "OrdenesTab";
            this.OrdenesTab.Padding = new System.Windows.Forms.Padding(3);
            this.OrdenesTab.Size = new System.Drawing.Size(764, 430);
            this.OrdenesTab.TabIndex = 2;
            this.OrdenesTab.Text = "Ordenes";
            this.OrdenesTab.UseVisualStyleBackColor = true;
            // 
            // panel4
            // 
            this.panel4.Location = new System.Drawing.Point(4, 7);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(200, 361);
            this.panel4.TabIndex = 0;
            // 
            // listaPersonasGrid
            // 
            this.listaPersonasGrid.Location = new System.Drawing.Point(0, 0);
            this.listaPersonasGrid.Name = "listaPersonasGrid";
            this.listaPersonasGrid.Size = new System.Drawing.Size(240, 150);
            this.listaPersonasGrid.TabIndex = 0;
            // 
            // listaOrganizacionesGrid
            // 
            this.listaOrganizacionesGrid.Location = new System.Drawing.Point(0, 0);
            this.listaOrganizacionesGrid.Name = "listaOrganizacionesGrid";
            this.listaOrganizacionesGrid.Size = new System.Drawing.Size(240, 150);
            this.listaOrganizacionesGrid.TabIndex = 0;
            // 
            // MenuGeneral
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(780, 511);
            this.Controls.Add(this.pestañas);
            this.Controls.Add(this.cerrarConexionBtn);
            this.Name = "MenuGeneral";
            this.Text = "Venta de repuestos para automoviles";
            this.Load += new System.EventHandler(this.MenuGeneral_Load);
            this.pestañas.ResumeLayout(false);
            this.clientesTab.ResumeLayout(false);
            this.clientesTab.PerformLayout();
            this.panelClientesAux.ResumeLayout(false);
            this.clientesTabControl.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.partesTab.ResumeLayout(false);
            this.ProveedorPartesTab.ResumeLayout(false);
            this.Partes_SubTab.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Partes_dataGridView)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.partesxproveedor_dataGridView)).EndInit();
            this.AutomovilPartesTab.ResumeLayout(false);
            this.AutomovilPartesTab.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.partesxautomovil_dataGridView)).EndInit();
            this.panel3.ResumeLayout(false);
            this.OrdenesTab.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.listaPersonasGrid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.listaOrganizacionesGrid)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cerrarConexionBtn;
        private System.Windows.Forms.TabControl pestañas;
        private System.Windows.Forms.TabPage clientesTab;
        private System.Windows.Forms.TabPage partesTab;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button listarClientesBtn;
        private System.Windows.Forms.Button cambiarEstadoCLienteBtn;
        private System.Windows.Forms.Button modificarClienteBtn;
        private System.Windows.Forms.Button insertarClienteBtn;
        private System.Windows.Forms.Panel panelClientesAux;
        private System.Windows.Forms.TabControl clientesTabControl;
        private System.Windows.Forms.TabPage personasTab;
        private System.Windows.Forms.TabPage organizacionesTab;
        private System.Windows.Forms.TabPage OrdenesTab;
        private System.Windows.Forms.TabControl ProveedorPartesTab;
        private System.Windows.Forms.TabPage Partes_SubTab;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage AutomovilPartesTab;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button listarPartesBtn;
        private System.Windows.Forms.Button actualizarPreciosParteProveedorBtn;
        private System.Windows.Forms.Button asociarParteAutomovil;
        private System.Windows.Forms.Button asociarParteProveedorBtn;
        private System.Windows.Forms.Button borrarParteBtn;
        private System.Windows.Forms.Button insertarParteBtn;
        private System.Windows.Forms.DataGridView Partes_dataGridView;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.DataGridViewTextBoxColumn NombreClm;
        private System.Windows.Forms.DataGridViewTextBoxColumn MarcaClm;
        private System.Windows.Forms.DataGridViewTextBoxColumn FabricanteClm;
        private System.Windows.Forms.DataGridViewTextBoxColumn AutomovilClm;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox proveedorCmb;
        private System.Windows.Forms.DataGridView partesxproveedor_dataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox automovilCmb;
        private System.Windows.Forms.DataGridView partesxautomovil_dataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn7;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn8;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProveedorClm;
        private System.Windows.Forms.DataGridViewTextBoxColumn Proveedor_Clm;

    }
}