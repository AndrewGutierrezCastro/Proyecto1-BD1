using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Proyecto1_BD1
{
	public sealed class ConectionBD
	{

		private readonly static SqlConnection conectionBD = new SqlConnection();
		public String pathBD;
        internal SqlConnection conexionBD;

        public ConectionBD(String pPathBD)
		{	
			conectionBD.ConnectionString = pathBD;
			pathBD = pPathBD;
		}
		public ConectionBD()
        {

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

		public int EjecutarProcedimientoAlmacenado(string procedimientoAlmacenado, String[] parametros, String[] argumentos, SqlConnection sqlConexion)
		{

			/*Metodo de uso muy puntual, el mismo debe usarse con extremo cuidado
			 * MP hay validaciones solo Precondiciones, deben venir la misma cantidad de argumentos como
			 * de parametros, y deben coincidir sus indexaciones.
			 * MANTENER SU USO SOLO ENTRE DESARROLLADORES.
			 * 
			 * 
			 * Andrew J Gutierrez Castro. Puede modificarse y utilizarse con completa libertad.
			 */
			int respuestaOperacion;
			if(sqlConexion.State == ConnectionState.Open)
            {
				closeConnection();
				openConnection();
			}
            else
            {
				openConnection();
            }
			using (sqlConexion)
			{
				using (SqlCommand comando = new SqlCommand(procedimientoAlmacenado, sqlConexion))
				{
					comando.CommandType = CommandType.StoredProcedure;
                    for (int i = 0; i < parametros.Length; i++)
                    {
						comando.Parameters.AddWithValue(parametros[i], argumentos[i]);

					}

					comando.Parameters.Add("@RespuestaOperacion", SqlDbType.Int).Direction = ParameterDirection.Output;
					comando.ExecuteNonQuery();

					respuestaOperacion = int.Parse(comando.Parameters["@RespuestaOperacion"].Value.ToString());

				}
			}
			return respuestaOperacion;
		}
	}

}
