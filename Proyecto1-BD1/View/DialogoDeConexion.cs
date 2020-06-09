using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto1_BD1
{
	public partial class ConectarServidorForm : Form
	{
        public static MenuGeneral menu;

        string databaseName = "tarea_programada_1_db";

        List<string> testingDevices = new List<string>()
        {
            "localhost", //  PC local
        };

        public string getConnectionPath(int index)
        {
            if (index >= 0 && index < testingDevices.Count)
                return "Data Source=" + testingDevices[index] +
                    ";Initial Catalog=" + databaseName +
                    "; Integrated Security=True";
            else
                return "";
        }

        public ConectarServidorForm()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			comboBoxBD.SelectedItem = testingDevices[0];
		}

		private void openConection_Click(object sender, EventArgs e)
		{
       
            string connectionPath = getConnectionPath( comboBoxBD.SelectedIndex );

            if (connectionPath != "") {
				
				conectionBD = new ConectionBD(connectionPath);
				Exception excep = conectionBD.openConnection();
				
				if(excep != null){
					string error = "Ha ocurrido un error tratando de conectar con la base de datos.\n" +
					excep.Message;
					String excepcionConexionBD = error;
					MessageBox.Show(excepcionConexionBD, "Arial", MessageBoxButtons.OK,MessageBoxIcon.Error);
				}
				else
				{
					AbrirConexionBtn.Enabled = false;
					this.Hide();
					menu = new MenuGeneral();
					menu.conectionBD = conectionBD;
                    menu.ShowDialog();
					this.Close();
				}
				
			} else
            {
                MessageBox.Show("Debe seleccionar una de las opciones",
                                "Arial", 
                                MessageBoxButtons.OK, 
                                MessageBoxIcon.Error);
            }
		}

		private ConectionBD conectionBD;

        private void agregarServidorBtn_Click(object sender, EventArgs e)
        {
			
		}
    }
}
