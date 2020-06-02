using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Proyecto1_BD1
{
	public sealed class ConectionBD
	{

		private readonly static SqlConnection conectionBD = new SqlConnection();
		private String pathBD;
		public ConectionBD(String pPathBD)
		{	
			conectionBD.ConnectionString = pathBD;
			pathBD = pPathBD;
		}

		public static SqlConnection Instance
		{
			get
			{
				return conectionBD;
			}
		}

		public Exception openConnection()
		{
			try
			{
				conectionBD.ConnectionString = pathBD;
				conectionBD.Open();
				Console.WriteLine("Conexion Exitosa");
				return null;
			}
			catch (SqlException e)
			{
				return e;
			}
			catch(InvalidOperationException e)
			{
				return e;
			}
		}

		public Exception closeConnection()
		{
			try
			{
				conectionBD.Close();
				Console.WriteLine("Conexion cerrada exitosamente");
				return null;
			}
			catch (SqlException e)
			{
				return e;
			}
			catch (InvalidOperationException e)
			{
				return e;
			}
		}
	}

}
