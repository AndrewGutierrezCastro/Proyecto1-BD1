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

        private void listarClientesBtn_Click(object sender, EventArgs e)
        {
            listarClientesTabControl.Visible = true;
            /* SqlConnection conexionBD = ConectionBD.Instance;
             SqlDataAdapter listarPersonas = new SqlDataAdapter("SELECT TOP (1000) [Cedula] ,[Nombre] ,[Direccion] ,[Numero] FROM viewPersonas", conexionBD);
             DataTable tablaPersonas = new DataTable();
             listarPersonas.Fill(tablaPersonas);
             dataGrid.DataSource = tablaPersonas;*/
        }

        private void MenuGeneral_Load(object sender, EventArgs e)
        {
            listarClientesTabControl.Visible = false;
        }

    }
}
