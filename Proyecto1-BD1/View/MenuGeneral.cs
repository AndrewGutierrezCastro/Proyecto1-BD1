using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Proyecto1_BD1.View;
using Proyecto1_BD1.Model;
using Proyecto1_BD1.Modelo;

namespace Proyecto1_BD1
{
    public partial class MenuGeneral : Form
    {
        private CrearPersona crearPersona;
        private CrearOrganizacion crearOrganizacion;
        private UpdatePersona updatePersona;
        private UpdateOrganizacion updateOrganizacion;
        private CambiarEstadoCliente cambiarEstadoCliente;
        private LocalizarProveedor localizarProveedor;
        private DataGridView listaPersonasGrid;
        private DataGridView listaOrganizacionesGrid;
        private FuncionesClientes funcionesClientes = new FuncionesClientes(ConectionBD.Instance);
        private FuncionesOrdenes funcionesOrdenes = new FuncionesOrdenes();
        public ConectionBD conectionBD;

        Ventana_Asociacion_Parte_Automovil ventanaAsociacionParteAutomovil = 
            new Ventana_Asociacion_Parte_Automovil();

        VentanaInsertarParte ventanaInsertarParte = new VentanaInsertarParte();


        public MenuGeneral()
        {
            InitializeComponent();
        }

        private void cerrarConexionBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conexionBD = ConectionBD.Instance;

            try
            {
                conexionBD.Close();
                Console.WriteLine("Conexion cerrada con exito");
            }
            catch (SqlException excep)
            {
                string error = "Ha ocurrido un error tratando de cerrar con la base de datos.\n" +
                    excep.Message;
                String excepcionConexionBD = error;
                MessageBox.Show(excepcionConexionBD, "Arial", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (InvalidOperationException excep)
            {
                string error = "Ha ocurrido un error tratando de cerrar con la base de datos.\n" +
                    excep.Message;
                String excepcionConexionBD = error;
                MessageBox.Show(excepcionConexionBD, "Arial", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            this.Close();
        }

        public void MenuGeneral_Load(object sender, EventArgs e)
        {
            // carga de datos en inicio de aplicacion
            funcionesClientes.conectionBD = conectionBD;
            funcionesOrdenes.ConectionBD = conectionBD;
            funcionesOrdenes.ConexionSqlBd = ConectionBD.Instance;

            funcionesClientes.CargarClientesBDtoLocal();
            Model.Automovil.loadData(ConectionBD.Instance);

            refreshPartes();

            List<Model.Proveedor> dataP = Model.Proveedor.loadProveedores(ConectionBD.Instance);
            LoadOpcionesProveedor(dataP, ProveedorCmb);


            loadProveedorPartes();

        }

        private void loadProveedorPartes()
        {
            List<Model.ProveedorPartes> data = Model.ProveedorPartes.loadData();

            this.partesProveedorDataGrid.Rows.Clear();

            foreach (Model.ProveedorPartes objeto in data)
            {
                this.partesProveedorDataGrid.Rows.Add(
                    new object[]
                    {
                        objeto.nombreProveedor, 
                        objeto.nombreParte,
                        objeto.porcentajeGanancia, 
                        objeto.precio,
                        objeto.precioFinal
                    }    
                );
            }

        }

        public void refreshPartes()
        {

            List<Modelo.Parte> data = Modelo.Parte.LoadData(ConectionBD.Instance);
            

            LoadPartes(data, Partes_dataGridView);

            LoadOpcionesParte( data, parteCmb );
            LoadOpcionesParte( data, PartesCmb);

 
        }

        public void cargarProveedorParteEdicion()
        {

            // todo

        }

        private void LoadPartes(List<Modelo.Parte> datosParte, DataGridView dataGrid)
        {
            dataGrid.Rows.Clear();

            foreach (Modelo.Parte parte in datosParte)
            {
                dataGrid.Rows.Add(
                    new Object[] {
                        parte.Nombre,
                        parte.Marca,
                        parte.NombreFabricante
                    }
                );
            }
        }

        private void LoadOpcionesParte(List<Modelo.Parte> datosParte, ComboBox opcionesParte)
        {

            opcionesParte.Items.Clear();

            foreach (Modelo.Parte parte in datosParte)
            {
                opcionesParte.Items.Add( parte.toString() );
            }
          
        }

        private void LoadOpcionesProveedor(List<Model.Proveedor> data, ComboBox opcionesParte)
        {

            opcionesParte.Items.Clear();

            foreach (Model.Proveedor proveedor in data)
            {
                opcionesParte.Items.Add(proveedor.toString());
            }

        }

        private void listarClientesBtn_Click(object sender, EventArgs e)
        {
            this.clientesTabControl.Show();
            
            //Generar Grid
            { listaOrganizacionesGrid = new DataGridView();
                listaPersonasGrid = new DataGridView();
                this.listaOrganizacionesGrid.AllowUserToAddRows = false;
                this.listaOrganizacionesGrid.AllowUserToDeleteRows = false;
                this.listaOrganizacionesGrid.AllowUserToOrderColumns = true;
                this.listaOrganizacionesGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                this.listaOrganizacionesGrid.Location = new System.Drawing.Point(6, 13);
                this.listaOrganizacionesGrid.Name = "listaOrganizacionesGrid";
                this.listaOrganizacionesGrid.ReadOnly = true;
                this.listaOrganizacionesGrid.Size = new System.Drawing.Size(577, 356);
                this.listaOrganizacionesGrid.TabIndex = 0;


                this.listaPersonasGrid.AllowUserToAddRows = false;
                this.listaPersonasGrid.AllowUserToDeleteRows = false;
                this.listaPersonasGrid.AllowUserToOrderColumns = true;
                this.listaPersonasGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                this.listaPersonasGrid.Location = new System.Drawing.Point(6, 6);
                this.listaPersonasGrid.Name = "listaPersonasGrid";
                this.listaPersonasGrid.ReadOnly = true;
                this.listaPersonasGrid.Size = new System.Drawing.Size(577, 363);
                this.listaPersonasGrid.TabIndex = 0; }

            this.organizacionesTab.Controls.Clear();
            this.personasTab.Controls.Clear();
            this.organizacionesTab.Controls.Add(listaOrganizacionesGrid);
            this.personasTab.Controls.Add(listaPersonasGrid);

            this.listaPersonasGrid.DataSource = funcionesClientes.TablaPersonas;
            this.listaOrganizacionesGrid.DataSource = funcionesClientes.TablaOrganizaciones;

        }
        private void insertarClienteBtn_Click(object sender, EventArgs e)
        {
            this.clientesTabControl.Show();
            this.crearPersona = new CrearPersona();
            this.crearPersona.Name = "crearPersona1";
            this.crearPersona.Size = new Size(374, 316);
            this.crearPersona.TabIndex = 2;

            this.personasTab.Controls.Clear();

            this.personasTab.Controls.Add(crearPersona);
            this.crearPersona.aceptarBtn.Click += new System.EventHandler(this.crearPersonaAceptarBtn_Click);
            this.crearPersona.cancelarBtn.Click += new System.EventHandler(this.crearPersonaCancelarBtn_Click);

            this.crearOrganizacion = new CrearOrganizacion();
            this.crearOrganizacion.Name = "crearOrganizacion1";
            this.crearOrganizacion.Size = new Size(637, 316);
            this.crearOrganizacion.TabIndex = 2;

            this.organizacionesTab.Controls.Clear();

            this.organizacionesTab.Controls.Add(crearOrganizacion);
            this.crearOrganizacion.aceptarBtn.Click += new System.EventHandler(this.crearOrganizacionAceptarBtn_Click);
            this.crearOrganizacion.cancelarBtn.Click += new System.EventHandler(this.crearOrganizacionCancelarBtn_Click);


        }
        private void crearPersonaAceptarBtn_Click(Object sender, EventArgs e)
        {

            String[] datosPersona = new String[] { "ACTIVO", "Cedula", "Nombre", "Direccion", "Numero" };
            datosPersona[1] = this.crearPersona.cedulaTxtBox.Text;
            datosPersona[2] = this.crearPersona.nombreTxtBox.Text;
            datosPersona[2] += " " + this.crearPersona.apellidosTxtBox.Text;
            datosPersona[3] = this.crearPersona.direccionTxtBox.Text;
            datosPersona[4] = this.crearPersona.numeroTxtBox.Text;
            int respuesta = funcionesClientes.CrearNuevaPersona(datosPersona);
            /*
	        POSIBLES RESPUESTAS
	         0 = caso exitoso
	        -1 = cedula invalida
	        -2 = nombre invalida
	        -3 = Direccion invalido
	        -4 = Numero no invalido
	        -5 = Estado invalido
	        -6 = Persona ya existe
	        */
            switch (respuesta)
            {
                case (0):
                    MessageBox.Show(datosPersona[2] + "\nAgregado Exitosamente", "Crear persona exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.crearPersona.limpiarBtn_Click(sender, e);
                    break;
                case (-1):
                    MessageBox.Show("No se puede crear" + datosPersona[2] + "\nCodigo error:" + respuesta + "\nLa cedula ingresada invalida.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-2):
                    MessageBox.Show("No se puede crear" + "\nCodigo error:" + respuesta + "\nEl nombre  ingresado es invalido.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-3):
                    MessageBox.Show("No se puede crear" + datosPersona[2] + "\nCodigo error:" + respuesta + "\nLa direccion  ingresada es invalida.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-4):
                    MessageBox.Show("No se puede crear" + datosPersona[2] + "\nCodigo error:" + respuesta + "\nEl numero  ingresado es invalido.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-5):
                    MessageBox.Show("No se puede crear" + datosPersona[2] + "\nCodigo error:" + respuesta + "\nEl estado del cliente es invalido.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-6):
                    MessageBox.Show("No se puede crear" + datosPersona[2] + "\nCodigo error:" + respuesta + "\nLa persona ya existe, revise la cedula.", "Crear Persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }
        private void crearPersonaCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.crearPersona.Hide();
        }
        private void crearOrganizacionAceptarBtn_Click(Object sender, EventArgs e)
        {
            String[] datosOrganizacion = new String[] { "ACTIVO", "CedulaJ", "Nombre", "Ciudad", "Direccion", "NombreCon", "CargoCon", "Numero" };
            datosOrganizacion[1] = this.crearOrganizacion.cedulaJuriTxtBox.Text;
            datosOrganizacion[2] = this.crearOrganizacion.nombreTxtBox.Text;
            datosOrganizacion[3] = this.crearOrganizacion.ciudadTxtBox.Text;
            datosOrganizacion[4] = this.crearOrganizacion.direccionTxtBox.Text;
            datosOrganizacion[5] = this.crearOrganizacion.nombreContacTxtBox.Text;
            datosOrganizacion[6] = this.crearOrganizacion.cargoContacTxtBox.Text;
            datosOrganizacion[7] = this.crearOrganizacion.numeroTxtBox.Text;
            int respuesta = funcionesClientes.CrearNuevaOrganizacion(datosOrganizacion);
            /*
             0 = caso exitoso
	        -1 = cedulaJuridica invalida
	        -2 = nombre invalida
	        -3 = Direccion invalido
	        -4 = Ciudad  invalida
	        -5 = Numero invalido
	        -6 = NombreContacto invalido
	        -7 = Cargo de Contacto invalido
	        -8 = Estado invalido
	        -9 = Organizacion ya existe
             */
            switch (respuesta)
            {
                case (0):
                    MessageBox.Show("Creado exitosamente", "Crear organizacion exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.crearOrganizacion.limpiarBtn_Click(sender, e);
                    break;
                case (-1):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nLa cedula ingresada invalida.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-2):
                    MessageBox.Show("No se puede crear" + "\nCodigo error:" + respuesta + "\nEl nombre  ingresado es invalido.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-3):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nLa direccion  ingresada es invalida.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-4):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nLa ciudad  ingresada es invalida.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-5):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nEl numero  ingresado es invalido.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-6):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nEl nombre del contacto ingresado es invalido.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-7):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nEl cargo del contacto ingresado es invalido.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-8):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nEl estado cliente es invalido.", "Crear Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-9):
                    MessageBox.Show("No se puede crear" + datosOrganizacion[2] + "\nCodigo error:" + respuesta + "\nLa organizacion ya existe, revise la cedula juridica.", "Arial", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }
        private void crearOrganizacionCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.crearOrganizacion.Hide();
        }
        private void modificarClienteBtn_Click(object sender, EventArgs e)
        {
            this.clientesTabControl.Show();
            this.updatePersona = new UpdatePersona();
            this.updatePersona.Name = "updatePersona1";
            this.updatePersona.Size = new Size(379, 349);
            this.updatePersona.TabIndex = 2;

            this.personasTab.Controls.Clear();

            this.personasTab.Controls.Add(updatePersona);
            this.updatePersona.aceptarBtn.Click += new System.EventHandler(this.updatePersonaAceptarBtn_Click);
            this.updatePersona.cancelarBtn.Click += new System.EventHandler(this.updatePersonaCancelarBtn_Click);

            this.updateOrganizacion = new UpdateOrganizacion();
            this.updateOrganizacion.Name = "updateOrganizacion1";
            this.updateOrganizacion.Size = new Size(589, 340);
            this.updateOrganizacion.TabIndex = 2;

            this.organizacionesTab.Controls.Clear();

            this.organizacionesTab.Controls.Add(updateOrganizacion);
            this.updateOrganizacion.aceptarBtn.Click += new System.EventHandler(this.updateOrganizacionAceptarBtn_Click);
            this.updateOrganizacion.cancelarBtn.Click += new System.EventHandler(this.updateOrganizacionCancelarBtn_Click);
        }
        private void updatePersonaAceptarBtn_Click(object sender, EventArgs e)
        {
            String[] datosPersona = new String[] { "ACTIVO", "Cedula", "Nombre", "Direccion", "Numero" };
            datosPersona[0] = this.updatePersona.estadoCmbBox.Text;
            datosPersona[1] = this.updatePersona.cedulaTxtBox.Text;
            datosPersona[2] = this.updatePersona.nombreTxtBox.Text;
            datosPersona[2] += " " + this.updatePersona.apellidosTxtBox.Text;
            datosPersona[3] = this.updatePersona.direccionTxtBox.Text;
            datosPersona[4] = this.updatePersona.numeroTxtBox.Text;
            int respuesta = funcionesClientes.UpdatePersona(datosPersona);
            switch (respuesta)
            {
                case (0):
                    MessageBox.Show("Actualizado Exitosamente", "Modificar persona exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.updatePersona.limpiarBtn_Click(sender, e);
                    break;
                case (-1):
                    MessageBox.Show("No se puede Actualizar\n" + "Codigo error:" + respuesta + "\nLa cedula ingresada no se encontró.", "Modificar persona ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }

        }
        private void updatePersonaCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.updatePersona.Hide();
        }
        private void updateOrganizacionAceptarBtn_Click(object sender, EventArgs e)
        {
            String[] datosOrganizacion = new String[] { "ACTIVO", "CedulaJ", "Nombre", "Ciudad", "Direccion", "NombreCon", "CargoCon", "Numero" };
            datosOrganizacion[0] = this.updateOrganizacion.estadoCmbBox.Text;
            datosOrganizacion[1] = this.updateOrganizacion.cedulaJuriTxtBox.Text;
            datosOrganizacion[2] = this.updateOrganizacion.nombreTxtBox.Text;
            datosOrganizacion[3] = this.updateOrganizacion.ciudadTxtBox.Text;
            datosOrganizacion[4] = this.updateOrganizacion.direccionTxtBox.Text;
            datosOrganizacion[5] = this.updateOrganizacion.nombreContacTxtBox.Text;
            datosOrganizacion[6] = this.updateOrganizacion.cargoContacTxtBox.Text;
            datosOrganizacion[7] = this.updateOrganizacion.numeroTxtBox.Text;
            int respuesta = funcionesClientes.UpdateOrganizacion(datosOrganizacion);
            switch (respuesta)
            {
                case (0):
                    MessageBox.Show("Actualizado Exitosamente", "Modificar organizacion exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.updateOrganizacion.limpiarBtn_Click(sender, e);
                    break;
                case (-1):
                    MessageBox.Show("No se puede Actualizar\n" + "Codigo error:" + respuesta + "\nLa cedula ingresada no se encontró.", "Modificar Organizacion ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }
        private void updateOrganizacionCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.updateOrganizacion.Hide();
        }
        private void cambiarEstadoCLienteBtn_Click(object sender, EventArgs e)
        {
            if(this.cambiarEstadoCliente != null)
            {
                this.cambiarEstadoCliente.Dispose();
            }
            this.cambiarEstadoCliente = new CambiarEstadoCliente();
            this.cambiarEstadoCliente.Name = "cambiarEstadoCliente1";
            this.cambiarEstadoCliente.Size = new Size(287, 167);
            this.cambiarEstadoCliente.TabIndex = 2;


            this.clientesTabControl.Hide();
            this.panelClientesAux.Controls.Add(cambiarEstadoCliente);
            this.cambiarEstadoCliente.aceptarBtn.Click += new System.EventHandler(this.cambiarEstadoClienteAceptarBtn_Click);
            this.cambiarEstadoCliente.cancelarBtn.Click += new System.EventHandler(this.cambiarEstadoClienteCancelarBtn_Click);
        }
        private void cambiarEstadoClienteAceptarBtn_Click(Object sender, EventArgs e)
        {

            String[] datosCliente = new String[] { "ACTIVO", "Cedula" };
            datosCliente[0] = this.cambiarEstadoCliente.estadoCmbBox.Text;
            datosCliente[1] = this.cambiarEstadoCliente.cedulaTxtBox.Text;
            int respuesta;
            bool isChecked = this.cambiarEstadoCliente.isOrganizacionCheckBox.Checked;
            if (isChecked)
            {
                respuesta = funcionesClientes.UpdateEstadoCliente(datosCliente, isChecked);
            }
            else
            {
                respuesta = funcionesClientes.UpdateEstadoCliente(datosCliente, isChecked);
            }
            

            switch (respuesta)
            {
                case (0):
                    MessageBox.Show("Actualizado Exitosamente", "Modificacion de estado exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.cambiarEstadoCliente.limpiarBtn_Click(sender, e);
                    break;
                case (-1):
                    MessageBox.Show("No se puede Actualizar\n" + "Codigo error:" + respuesta + "\nEl estado ingresado es invalido. Debe ser ACTIVO," +
                        " INACTIVO o SUSPENDIDO", "Modificar estado ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case (-2):
                    MessageBox.Show("No se puede Actualizar\n" + "Codigo error:" + respuesta + "\nLa cedula ingresada no se encontró.", "Modificar estado ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }

            this.clientesTabControl.Show();
        }
        private void cambiarEstadoClienteCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.cambiarEstadoCliente = null ;
            this.clientesTabControl.Show();

        }
        //END CLIENTES

        //ORDENES
        private void localizarProveedorBtn_Click(object sender, EventArgs e)
        {
            this.localizarProveedor = new LocalizarProveedor();
            this.localizarProveedor.Name = "localizarProveedor1";
            this.localizarProveedor.Size = new Size(582, 351);
            this.localizarProveedor.TabIndex = 2;

            List<Parte> partes = Parte.PartesCargadas;
            foreach (Parte parte in partes)
            {
                this.localizarProveedor.nombrePartesComboBox.Items.Add(parte.Nombre);
            }

            this.ordenesPanelAux.Controls.Clear();

            this.ordenesPanelAux.Controls.Add(localizarProveedor);
            this.localizarProveedor.aceptarBtn.Click += new System.EventHandler(this.localizarProveedorAceptarBtn_Click);
            this.localizarProveedor.cancelarBtn.Click += new System.EventHandler(this.localizarProveedorCancelarBtn_Click);
        }

        private void localizarProveedorCancelarBtn_Click(object sender, EventArgs e)
        {
            this.localizarProveedor.Hide();
        }

        private void localizarProveedorAceptarBtn_Click(object sender, EventArgs e)
        {
            String  nombreParte= "PARTE" ;
            if(localizarProveedor.nombrePartesComboBox.SelectedIndex == -1)
            {
                MessageBox.Show("No se puede encontrar\n" + "Codigo error:-1"+"\nLa parte ingresada no existe.", "Proveedor por parte ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            {
                nombreParte = Parte.PartesCargadas[localizarProveedor.nombrePartesComboBox.SelectedIndex].Nombre;
            }

            List<Proveedor> proveedores = Proveedor.GetListProveedor(ConectionBD.Instance, nombreParte);

            if(proveedores.Count == 0)
            {
                this.localizarProveedor.limpiarBtn_Click(sender, e);
                MessageBox.Show("No se puede encontrar\n" + "Codigo error:-1" + "\nLa parte ingresada no tiene proveedores.", "Proveedor por parte ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            MessageBox.Show("Busqueda Exitosa", "Busqueda proveedores por parte", MessageBoxButtons.OK, MessageBoxIcon.Information);
            foreach (Proveedor proveedor in proveedores)
            {
                this.localizarProveedor.proveedorDataGridView.Rows.Add(proveedor.Codigo.ToString(), proveedor.Nombre);

            }        
            
        }

        //END ORDENES
        private void Partes_dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void loadPartesAuto()
        {
            partesxautomovil_dataGridView.Rows.Clear();

            string anno = annoTxt.Text;
            string modelo = modeloTxt.Text;

            if (!anno.Equals("") && !modelo.Equals(""))
            {

                int res =
                    Modelo.Parte.loadDataByAutomovil(
                        ConectionBD.Instance, modelo, anno);

                if (res == 0)
                {
                    List<Modelo.Parte> data = Modelo.Parte.PartesXAutomovilCargadas;

                    foreach (Modelo.Parte parte in data)
                    {
                        partesxautomovil_dataGridView.Rows.Add(
                            new Object[]
                            {
                            parte.Nombre,
                            parte.Marca,
                            parte.NombreFabricante,
                            parte.DetalleAutomovil

                            }

                        );
                    }
                }
                else if (res == -1)
                {

                }

            }
            else
            {
                partesxautomovil_dataGridView.Rows.Clear();
            }


        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void borrarParteBtn_Click(object sender, EventArgs e)
        {
            int selectedIndex = this.Partes_dataGridView.CurrentRow.Index;

            if (selectedIndex != -1)
            {
                ( Modelo.Parte.PartesCargadas[selectedIndex] ).Delete( ConectionBD.Instance );
            } else
            {
                MessageBox.Show("Debe seleccionar alguna parte en la tabla", "Aviso");
            }
        }

        private void proveedorCmb_SelectedIndexChanged(object sender, EventArgs e)
        {
            // llenado de tabla de proveedores segun la parte elegida

            int selectedIndex = this.parteCmb.SelectedIndex;

            if (selectedIndex != -1)
            {
                List<Model.Proveedor> data = Model.Proveedor.loadProveedorPorParte(
                    ConectionBD.Instance,
                    Modelo.Parte.PartesCargadas[selectedIndex]
                );

                foreach (Model.Proveedor proveedor in data)
                {

                    this.partesxproveedor_dataGridView.Rows.Add(
                        new object[]
                        {
                        proveedor.Nombre,
                        proveedor.Codigo
                        }
                    );
                }
            } 
        }

        public int mostrarDialogo( string caption, UserControl userForm )
        {
            Form prompt = new Form();
            prompt.Text = caption;
            prompt.Width = userForm.Width;
            prompt.Height = userForm.Height;
            prompt.Controls.Add(userForm);
   
            prompt.ShowDialog();
            return (int) 1;
        }

        private void asociarParteAutomovil_Click(object sender, EventArgs e)
        {
            this.ventanaAsociacionParteAutomovil.reset();
            this.ventanaAsociacionParteAutomovil.cargarDialogo();
            mostrarDialogo("Asociacion de Parte con tipo de automovil", this.ventanaAsociacionParteAutomovil);
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }


        private void PrecioFinalTxt_TextChanged(object sender, EventArgs e)
        {

        }

        private void PartesCmb_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void actualizarPrecio()
        {
            float precio = 0;
            decimal porcentaje = 0;

            try
            {
                precio = float.Parse(precioParteTxt.Text);

            } catch (FormatException e)
            {
                precio = 0;
            }

            try
            {
                porcentaje = decimal.Parse(PorcentajeGananciaTxt.Text);

            }
            catch (FormatException e)
            {
                porcentaje = 0;
            }

           float precioFinal = (precio + precio * (float) (1 / porcentaje));

            PrecioFinalTxt.Text = precioFinal.ToString();

        }

        private void precioParteTxt_TextChanged(object sender, EventArgs e)
        {
            actualizarPrecio();
        }

        private void PorcentajeGananciaTxt_TextChanged(object sender, EventArgs e)
        {
            actualizarPrecio();
        }

        private void mostrarPartesAutobtn_Click(object sender, EventArgs e)
        {
            partesxautomovil_dataGridView.Rows.Clear();
            loadPartesAuto();
        }

        private void insertarParteBtn_Click(object sender, EventArgs e)
        {
            this.ventanaInsertarParte.reset();
            mostrarDialogo("Insertar nueva parte", this.ventanaInsertarParte);
        }

        private void ProveedorCmb_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void asociarProveedorParteBtn_Click(object sender, EventArgs e)
        {

            int indiceParte = PartesCmb.SelectedIndex;
            int indiceProveedor = ProveedorCmb.SelectedIndex;

            decimal precio = 0, precioF = 0, porcentaje = 0;
            bool flag = false;

            try
            {
                precio = decimal.Parse(precioParteTxt.Text);
            } catch (FormatException ex)
            {
                flag = true;
            }
            
            try { 
            precioF = decimal.Parse(PrecioFinalTxt.Text);
            } catch (FormatException ex)
            {
                flag = true;
            }

            try
            {
                porcentaje = decimal.Parse(PorcentajeGananciaTxt.Text);
            }
            catch (FormatException exe)
            {
                flag = true;
            }


            if (flag)
            {
                MessageBox.Show("Verifique los campos de precios para la parte del proveedor", "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Information);
            } 
            else if (indiceParte == -1 || indiceProveedor == -1)
            {
                MessageBox.Show("Debe seleccionar el proveedor y la parte correspondiente", "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {

                Modelo.Parte parte = Modelo.Parte.PartesCargadas[indiceParte];

                int res = parte.LinkProveedor(
                    Model.Proveedor.ProveedoresCargados[indiceProveedor].Id, 
                    precio, 
                    porcentaje, 
                    precioF
                );

                /*
	                POSIBLES RESPUESTAS
	                 0 = caso exitoso
	                -1 = parte no existente
	                -2 = proveedor no existente
	                -3 = parte y proveedor no existente
                */

                if ( res == -1 )
                {
                    MessageBox.Show("Parte no existente",
                        "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Error);
                } 
                else if (res == -2)
                {
                    MessageBox.Show("Proveedor no existente",
                        "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if (res == -3)
                {
                    MessageBox.Show("Proveedor y parte no existente",
                       "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show("Parte para el proveedor ha sido agregada",
                       "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }



            }


        }
    }
}
