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
		public ConectarServidorForm()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			comboBoxBD.SelectedItem = "DESKTOP-QHTQCVG";
		}

		private void openConection_Click(object sender, EventArgs e)
		{	
			if(comboBoxBD.GetItemText(comboBoxBD.SelectedItem.ToString()) == "DESKTOP-QHTQCVG")
			{
				servidorBDNombre = listaConexionBase[0];
			}
			else
			{
				servidorBDNombre = listaConexionBase[1];
			}
			if (servidorBDNombre != "") {
				
				conectionBD = new ConectionBD(servidorBDNombre);
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
					MenuGeneral menuGeneral = new MenuGeneral();
					menuGeneral.ShowDialog();
					this.Close();
				}
				
				
				
			}
			
			
		}

		private ConectionBD conectionBD;
		private List<String> listaConexionBase = new List<string>(){ "Data Source=DESKTOP-QHTQCVG;Initial Catalog=tarea_programada_1_db; Integrated Security=True","" };
		private string servidorBDNombre;
	}
}
