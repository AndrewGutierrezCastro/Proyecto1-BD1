using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace Proyecto1_BD1.Model
{
    class Proveedor
    {
        private static string readProveedores = "ReadProveedores";
        private static string readProveedoresPorParte = "ReadProveedoresPorParte";

        public static List<Proveedor> ProveedoresPorParteCargados = new List<Proveedor>();
        public static List<Proveedor> ProveedoresCargados = new List<Proveedor>();

        private int id, codigo;
        private string nombre, direccion, ciudad, nombreContacto;

        public int Id { get => id; set => id = value; }
        public int Codigo { get => codigo; set => codigo = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Ciudad { get => ciudad; set => ciudad = value; }
        public string NombreContacto { get => nombreContacto; set => nombreContacto = value; }


        public Proveedor(int id, string nombre, string direccion, string ciudad, string nombreContacto)
        {
            this.id = id;
            this.nombre = nombre;
            this.direccion = direccion;
            this.ciudad = ciudad;
            this.nombreContacto = nombreContacto;
        }

        public Proveedor(int id, string nombre, int codigo)
        {
            this.id = id;
            this.nombre = nombre;
            this.codigo = codigo;
        }

        public Proveedor(string nombre, int codigo)
        {

            this.nombre = nombre;
            this.codigo = codigo;
        }

        public static List<Proveedor> loadProveedorPorParte(SqlConnection connection, Modelo.Parte parte)
        {
            List<Proveedor> data = new List<Proveedor>();

            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(readProveedoresPorParte, connection))
            {
                comando.CommandType = CommandType.StoredProcedure;

                SqlParameter nombreParte = comando.Parameters.Add("@NombreParte", SqlDbType.NChar);
                SqlParameter resultadoOperacion = comando.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                resultadoOperacion.Direction = ParameterDirection.Output;
                nombreParte.Value = parte.Nombre;

                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Proveedor(
                            (string)lector["Nombre"],
                            (int)lector["Codigo"]
                     ));
                }


            }

            ProveedoresPorParteCargados = data;
            return data;
        }

        public static List<Proveedor> loadProveedores(SqlConnection connection)
        {

            List<Proveedor> data = new List<Proveedor>();

            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(readProveedores, connection))
            {

                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {

                    data.Add(
                        new Proveedor(
                            (int)lector["Id"],
                            (string)lector["Nombre"],
                            (int)lector["Codigo"]
                        )
                   );

                }

                ProveedoresCargados = data;

            }

            return data;

        }

        public static List<Proveedor> GetListProveedor(SqlConnection connection, String parteName)
        {
            List<Proveedor> data = new List<Proveedor>();

            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(readProveedoresPorParte, connection))
            {
                comando.CommandType = CommandType.StoredProcedure;

                SqlParameter nombreParte = comando.Parameters.Add("@NombreParte", SqlDbType.VarChar);
                SqlParameter resultadoOperacion = comando.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                resultadoOperacion.Direction = ParameterDirection.Output;
                nombreParte.Value = parteName;

                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Proveedor(
                            (string)lector["Nombre"],
                            (int)lector["Codigo"]
                     ));
                }
            }
            return data;
        }

        public string toString()
        {
            return this.codigo + "-" + this.nombre;
        }

    }
}
