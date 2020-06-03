using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Proyecto1_BD1.Model
{
    class ProveedorPartes
    {

        public static string read = "ReadProveedoresPartes";

        public static List<ProveedorPartes> proveedoresPartesCargadas =
            new List<ProveedorPartes>();

        public int id;
        public string nombreParte, nombreProveedor, marca;
        public decimal precio, precioFinal, porcentajeGanancia;



        
        public ProveedorPartes(int id, string nombreParte, string nombreProveedor, string marca,
            decimal precio, decimal precioFinal, decimal porcentajeGanancia)
        {
            this.id = id;
            this.nombreParte = nombreParte;
            this.nombreProveedor = nombreProveedor;
            this.precio = precio;
            this.marca = marca;
            this.precioFinal = precioFinal;
            this.porcentajeGanancia = porcentajeGanancia;
        }

        public static List<ProveedorPartes> loadData()
        {

            SqlConnection connection = ConectionBD.Instance;

            List<ProveedorPartes> data = new List<ProveedorPartes>();

            connection.Close();
            connection.Open();

            using (SqlCommand proceso = new SqlCommand(read, connection))
            {
                SqlDataReader lector = proceso.ExecuteReader();

                while (lector.Read())
                {
                    /*
                     int id, string nombreParte, string nombreProveedor, string marca,
                    decimal precio, decimal precioFinal, decimal porcentajeGanancia
                     */

                    data.Add(
                        new ProveedorPartes(
                            (int)lector["Id"],
                            (string)lector["Nombre"],
                            (string)lector["Marca"],
                            (string)lector["NombreProveedor"], 
                            (decimal) lector["Precio"],
                            (decimal)lector["PrecioFinal"],
                            (decimal)lector["PorcentajeGanancia"]

                        )
                    );
                }

            }

            proveedoresPartesCargadas = data;

            return data;

        }




    }
}
