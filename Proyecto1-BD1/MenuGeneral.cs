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

namespace Proyecto1_BD1
{
    public partial class MenuGeneral : Form
    {
        private CrearPersona crearPersona;
        private CrearOrganizacion crearOrganizacion;
        private DataGridView listaPersonasGrid;
        private DataGridView listaOrganizacionesGrid;
        private FuncionesClientes funcionesClientes = new FuncionesClientes(ConectionBD.Instance);
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

        private void MenuGeneral_Load(object sender, EventArgs e)
        {
            funcionesClientes.CargarClientesBDtoLocal();
        }

        private void listarClientesBtn_Click(object sender, EventArgs e)
        {
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
        private void  crearPersonaAceptarBtn_Click(Object sender, EventArgs e)
        {
            String[] datosPersona = new String[] { "ACTIVO", "Cedula", "Nombre", "Direccion", "Numero" };
            datosPersona[1] = this.crearPersona.cedulaTxtBox.Text;
            datosPersona[2] = this.crearPersona.nombreTxtBox.Text;
            datosPersona[2] += " " + this.crearPersona.apellidosTxtBox.Text;
            datosPersona[3] = this.crearPersona.direccionTxtBox.Text;
            datosPersona[4] = this.crearPersona.numeroTxtBox.Text;
            int respuesta = funcionesClientes.CrearNuevaPersona(datosPersona);
            if ( respuesta == 0)
            {   
                MessageBox.Show(datosPersona[2]+"\nAgregado Exitosamente", "Arial", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.crearPersona.limpiarBtn_Click(sender, e);
            }
            else
            {
                MessageBox.Show(datosPersona[2] + "\nNo se puede agregar\n"+"Codigo error:"+respuesta, "Arial", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            if ( respuesta == 0)
            {
                MessageBox.Show(datosOrganizacion[2] + "\nAgregado Exitosamente", "Arial", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.crearPersona.limpiarBtn_Click(sender, e);
            }
            else
            {
                MessageBox.Show(datosOrganizacion[2] + "\nNo se puede agregar\n" + "Codigo error:" + respuesta, "Arial", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void crearOrganizacionCancelarBtn_Click(Object sender, EventArgs e)
        {
            this.crearOrganizacion.Hide();
        }
        private void Partes_dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
