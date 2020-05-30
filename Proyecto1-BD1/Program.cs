using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using Proyecto1_BD1;

namespace Proyecto1_BD1
{
	static class Program
	{
		/// <summary>
		/// Punto de entrada principal para la aplicación.
		/// </summary>
		[STAThread]
		static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			ConectionBD conectionBD = new ConectionBD("Data Source=DESKTOP-QHTQCVG;Initial Catalog=tarea_programada_1_db; Integrated Security=True");
			conectionBD.openConnection();
			conectionBD.closeConnection();
			Application.Run(new Form1());
			
		}
	}
}
