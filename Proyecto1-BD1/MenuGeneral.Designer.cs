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
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.listarClientesBtn = new System.Windows.Forms.Button();
            this.cambiarEstadoCLienteBtn = new System.Windows.Forms.Button();
            this.modificarClienteBtn = new System.Windows.Forms.Button();
            this.insertarClienteBtn = new System.Windows.Forms.Button();
            this.partesTab = new System.Windows.Forms.TabPage();
            this.listarClientesTabControl = new System.Windows.Forms.TabControl();
            this.listaPersonasTab = new System.Windows.Forms.TabPage();
            this.listarOrganizacionesTab = new System.Windows.Forms.TabPage();
            this.pestañas.SuspendLayout();
            this.clientesTab.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.listarClientesTabControl.SuspendLayout();
            this.SuspendLayout();
            // 
            // cerrarConexionBtn
            // 
            this.cerrarConexionBtn.Location = new System.Drawing.Point(506, 419);
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
            this.pestañas.Location = new System.Drawing.Point(13, 13);
            this.pestañas.Name = "pestañas";
            this.pestañas.SelectedIndex = 0;
            this.pestañas.Size = new System.Drawing.Size(630, 400);
            this.pestañas.TabIndex = 1;
            // 
            // clientesTab
            // 
            this.clientesTab.Controls.Add(this.panel2);
            this.clientesTab.Controls.Add(this.panel1);
            this.clientesTab.Location = new System.Drawing.Point(4, 22);
            this.clientesTab.Name = "clientesTab";
            this.clientesTab.Padding = new System.Windows.Forms.Padding(3);
            this.clientesTab.Size = new System.Drawing.Size(622, 374);
            this.clientesTab.TabIndex = 0;
            this.clientesTab.Text = "Clientes";
            this.clientesTab.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.listarClientesTabControl);
            this.panel2.Location = new System.Drawing.Point(149, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(472, 373);
            this.panel2.TabIndex = 1;
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
            // 
            // partesTab
            // 
            this.partesTab.Location = new System.Drawing.Point(4, 22);
            this.partesTab.Name = "partesTab";
            this.partesTab.Padding = new System.Windows.Forms.Padding(3);
            this.partesTab.Size = new System.Drawing.Size(622, 374);
            this.partesTab.TabIndex = 1;
            this.partesTab.Text = "Partes";
            this.partesTab.UseVisualStyleBackColor = true;
            // 
            // listarClientesTabControl
            // 
            this.listarClientesTabControl.Controls.Add(this.listaPersonasTab);
            this.listarClientesTabControl.Controls.Add(this.listarOrganizacionesTab);
            this.listarClientesTabControl.Location = new System.Drawing.Point(6, 7);
            this.listarClientesTabControl.Name = "listarClientesTabControl";
            this.listarClientesTabControl.SelectedIndex = 0;
            this.listarClientesTabControl.Size = new System.Drawing.Size(464, 364);
            this.listarClientesTabControl.TabIndex = 0;
            this.listarClientesTabControl.Visible = false;
            // 
            // listaPersonasTab
            // 
            this.listaPersonasTab.Location = new System.Drawing.Point(4, 22);
            this.listaPersonasTab.Name = "listaPersonasTab";
            this.listaPersonasTab.Padding = new System.Windows.Forms.Padding(3);
            this.listaPersonasTab.Size = new System.Drawing.Size(456, 338);
            this.listaPersonasTab.TabIndex = 0;
            this.listaPersonasTab.Text = "Personas";
            this.listaPersonasTab.UseVisualStyleBackColor = true;
            // 
            // listarOrganizacionesTab
            // 
            this.listarOrganizacionesTab.Location = new System.Drawing.Point(4, 22);
            this.listarOrganizacionesTab.Name = "listarOrganizacionesTab";
            this.listarOrganizacionesTab.Padding = new System.Windows.Forms.Padding(3);
            this.listarOrganizacionesTab.Size = new System.Drawing.Size(456, 338);
            this.listarOrganizacionesTab.TabIndex = 1;
            this.listarOrganizacionesTab.Text = "Organizaciones";
            this.listarOrganizacionesTab.UseVisualStyleBackColor = true;
            // 
            // MenuGeneral
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(655, 455);
            this.Controls.Add(this.pestañas);
            this.Controls.Add(this.cerrarConexionBtn);
            this.Name = "MenuGeneral";
            this.Text = "MenuGeneral";
            this.Load += new System.EventHandler(this.MenuGeneral_Load);
            this.pestañas.ResumeLayout(false);
            this.clientesTab.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.listarClientesTabControl.ResumeLayout(false);
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
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TabControl listarClientesTabControl;
        private System.Windows.Forms.TabPage listaPersonasTab;
        private System.Windows.Forms.TabPage listarOrganizacionesTab;
    }
}