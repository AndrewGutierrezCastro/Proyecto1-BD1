using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Proyecto1_BD1
{
	class ConectionBD
	{
		public SqlConnection conectionBD = new SqlConnection();
		public ConectionBD(String pathBD)
		{
			conectionBD.ConnectionString = pathBD;
		}

		public void openConnection()
		{
			try
			{
				conectionBD.Open();
				Console.WriteLine("Conexion Exitosa");
			}
			catch (Exception e)
			{
				Console.WriteLine("La conexion con la base de datos ha fallado"+e.Message);
			}
		}

		public void closeConnection()
		{
			conectionBD.Close();
			Console.WriteLine("Conexion cerrada exitosamente");
		}
	}

}
