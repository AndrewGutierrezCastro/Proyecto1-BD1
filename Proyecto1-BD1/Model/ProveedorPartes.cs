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
        public static string updatePrecios = "UpdatePreciosParteProveedor";
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

        public ProveedorPartes(int id, string nombreParte, string nombreProveedor,
            decimal precio, decimal precioFinal, decimal porcentajeGanancia)
        {
            this.id = id;
            this.nombreParte = nombreParte;
            this.nombreProveedor = nombreProveedor;
            this.precio = precio;
            this.precioFinal = precioFinal;
            this.porcentajeGanancia = porcentajeGanancia;
        }

        public ProveedorPartes(int id,
           decimal precio, decimal precioFinal, decimal porcentajeGanancia)
        {
            this.id = id;
            this.precio = precio;
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

        public int update(int id)
        {

            SqlConnection connection = ConectionBD.Instance;
            connection.Close();
            connection.Open();

            /*
             
             @IdProveedorParte int,
	            @Precio decimal(9,2),
	            @PorcentajeGanancia decimal(9,2),
	            @PrecioFinal decimal(9,2),
	        @RespuestaOperacion int OUTPUT
             */

            using (SqlCommand comando = new SqlCommand(updatePrecios, connection))
            {
                comando.CommandType = CommandType.StoredProcedure;

                SqlParameter idProveedorParte = comando.Parameters.AddWithValue("@IdProveedorParte", id);
                SqlParameter precio = comando.Parameters.AddWithValue("@Precio", this.precio);
                SqlParameter porcentaje = comando.Parameters.AddWithValue("@PorcentajeGanancia", this.porcentajeGanancia);
                SqlParameter precioFinal = comando.Parameters.AddWithValue("@PrecioFinal", this.precioFinal);
                SqlParameter resultado = comando.Parameters.AddWithValue("@ResultadoOperacion", 0);


                resultado.Direction = ParameterDirection.Output;

                int result = comando.ExecuteNonQuery();

                return int.Parse(resultado.Value.ToString());

            }

        }

        public string toString()
        {
            return this.nombreParte + this.nombreProveedor;
        }

    }
}
