using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace Proyecto1_BD1.Modelo
{
    class Parte
    {
        // db linking
        public static String insertarParte = "CreateParte";
        public static String mostrarPartes_sp = "ReadPartes";
        public static String readPartesPorAutomovil_sp = "ReadPartesPorAutomovil";
        public static String deletePartes_sp  = "DeleteParte";
        public static String linkParteAutomovil_sp = "LinkParteTipoAutomovil";
        public static String linkParteProveedor = "LinkParteProveedor";

        // atributos
        private string nombre, marca, nombreFabricante, detalleAutomovil;
        private int id;

        public static List<Parte> PartesCargadas;
        public static List<Parte> PartesXProveedorCargadas;
        public static List<Parte> PartesXAutomovilCargadas;

        public static DataTable PartesXAutomovilDataTable;
        // methods
        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Marca { get => marca; set => marca = value; }
        public string NombreFabricante { get => nombreFabricante; set => nombreFabricante = value; }
    
        public string DetalleAutomovil { get => detalleAutomovil; set => detalleAutomovil = value; }

        public Parte(int id, string nombre, string marca, string nombreFabricante, string detalleAutomovil) {
            this.id = id;
            this.nombre = nombre;
            this.marca = marca;
            this.nombreFabricante = nombreFabricante;
            this.detalleAutomovil = detalleAutomovil;
        }

        public Parte(int id, string nombre, string marca, string nombreFabricante)
        {
            this.id = id;
            this.nombre = nombre;
            this.marca = marca;
            this.nombreFabricante = nombreFabricante;
        }

        public static List<Parte> loadDataByProvider(SqlConnection connection, Parte parteSeleccionada)
        {
            List<Parte> data = new List<Parte>();

            using (SqlCommand proceso = new SqlCommand(mostrarPartes_sp, connection))
            {
                SqlParameter provider = proceso.Parameters.Add("@IdProveedor", SqlDbType.Int);

                SqlDataReader lector = proceso.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Parte(
                            (int)lector["Id"],
                            (string)lector["nombre"],
                            (string)lector["marca"],
                            (string)lector["nombreFabricante"],
                            (string)lector["detalle"]
                        )
                    );
                }

            }

            PartesXProveedorCargadas = data;

            return data;
        }

        public static int loadDataByAutomovil(SqlConnection connection, string modelo, string anno)
        {
            DataTable data = new DataTable();
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
                connection.Open();
            }
            else
            {
                connection.Open();
            }

            int res = -1;

            using (SqlCommand proceso = new SqlCommand(readPartesPorAutomovil_sp, connection))
            {
                proceso.CommandType = CommandType.StoredProcedure;
                SqlParameter pmodelo = proceso.Parameters.AddWithValue("@Modelo", modelo);
                SqlParameter panno = proceso.Parameters.AddWithValue("@Anno", anno);
                SqlParameter respuesta = proceso.Parameters.AddWithValue("@RespuestaOperacion", 0);

                respuesta.Direction = ParameterDirection.ReturnValue;

                SqlDataReader lector = proceso.ExecuteReader();

                res = int.Parse(respuesta.Value.ToString());

                if ( res == 0)
                {

                    data.Load(lector) ;
                            
                }
            }

            PartesXAutomovilDataTable = data;

            return res;

        }


        public static List<Parte> LoadData( SqlConnection connection )
        {
            List<Parte> data = new List<Parte>();

            connection.Close();
            connection.Open();

            using (SqlCommand proceso = new SqlCommand(mostrarPartes_sp, connection))
            {
                SqlDataReader lector = proceso.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Parte(
                            (int) lector["Id"],
                            (string) lector["nombre"],
                            (string) lector["marca"],
                            (string) lector["nombreFabricante"],""

                        )
                    );
                }

            }

            PartesCargadas = data; 

            return data;
        }

        public void Delete( SqlConnection connection )  
        {
            using (SqlCommand proceso = new SqlCommand(deletePartes_sp, connection))
            {
                proceso.CommandType = CommandType.StoredProcedure;

                SqlParameter idParameter = proceso.Parameters.Add("@IdParte", SqlDbType.Int);
                SqlParameter resultParameter = proceso.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                idParameter.Value = this.id;
                resultParameter.Direction = ParameterDirection.Output;

                int result = proceso.ExecuteNonQuery();

                /*
	                POSIBLES RESPUESTAS
	                 0 = caso exitoso
	                -1 = parte no existente
	                -2 = participa en una orden
                */

                int outResult = int.Parse( resultParameter.Value.ToString() );

                if ( outResult == -1 )
                {
                    MessageBox.Show(
                        " La parte dada no existe ", 
                        " Accion no realizada ", 
                        MessageBoxButtons.OK, 
                        MessageBoxIcon.Error);

                } else if ( outResult == -2 )
                {
                    MessageBox.Show(
                        " La parte ya participa en una orden ",
                        " Accion no realizada ",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error);
                } else
                {
                    MessageBox.Show(
                        " Se ha eliminado la parte " + this.Nombre,
                        " Accion realizada con exito ",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information);

                    Proyecto1_BD1.ConectarServidorForm.menu.refreshPartes();
                   
                }
            }
        }

        public int LinkAutomovil(SqlConnection connection, Model.Automovil automovil)
        {

            connection.Close();
            connection.Open();

            using (SqlCommand proceso = new SqlCommand(linkParteAutomovil_sp, connection))
            {
                proceso.CommandType = CommandType.StoredProcedure;

                SqlParameter idParameter = proceso.Parameters.Add("@IdParte", SqlDbType.Int);
                SqlParameter idAutomovil = proceso.Parameters.Add("@IdAutomovil", SqlDbType.Int);
                SqlParameter resultParameter = proceso.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                idParameter.Value = this.id;
                idAutomovil.Value = automovil.Id;
                resultParameter.Direction = ParameterDirection.Output;

                int result = proceso.ExecuteNonQuery();

                return int.Parse(resultParameter.Value.ToString());
            }

            return -1;
        }

        public int LinkProveedor( int idProveedor, decimal precio, decimal porcentaje, decimal precioFinal )
        {
            /*
             
                @IdParte int,
	            @IdProveedor int, 
	            @Precio decimal(9,2),
	            @PorcentajeGanancia decimal(9,2),
	            @PrecioFinal decimal(9,2),
	            @RespuestaOperacion int OUTPUT
           */

            ConectionBD.Instance.Close();
            ConectionBD.Instance.Open();

            using (SqlCommand proceso = new SqlCommand(linkParteProveedor, ConectionBD.Instance))
            {
                proceso.CommandType = CommandType.StoredProcedure;

                SqlParameter idParteP = proceso.Parameters.Add("@IdParte", SqlDbType.Int);
                SqlParameter idProveedorP = proceso.Parameters.Add("@IdProveedor", SqlDbType.Int);
                SqlParameter precioP = proceso.Parameters.Add("@Precio", SqlDbType.Decimal);
                SqlParameter precioFinalP = proceso.Parameters.Add("@PrecioFinal", SqlDbType.Decimal);
                SqlParameter porcentajeP = proceso.Parameters.Add("@PorcentajeGanancia", SqlDbType.Decimal);


                SqlParameter resultParameter = proceso.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                idProveedorP.Value = idProveedor;
                idParteP.Value = this.id;
                precioP.Value = precio;
                precioFinalP.Value = precioFinal;
                porcentajeP.Value = porcentaje;
                resultParameter.Direction = ParameterDirection.Output;

                int result = proceso.ExecuteNonQuery();

                return int.Parse(resultParameter.Value.ToString());
            }

        }

        public int createParte(SqlConnection connection)
        {
            connection.Close();
            connection.Open();

            using (SqlCommand proceso = new SqlCommand(insertarParte, connection))
            {
                proceso.CommandType = CommandType.StoredProcedure;

                SqlParameter nombre = proceso.Parameters.Add("@Nombre", SqlDbType.NChar);
                SqlParameter marca = proceso.Parameters.Add("@Marca", SqlDbType.NChar);
                SqlParameter fabricante = proceso.Parameters.Add("@NombreFabricante", SqlDbType.NChar);
                SqlParameter resultado = proceso.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                nombre.Value = this.nombre;
                marca.Value = this.marca;
                fabricante.Value = this.nombreFabricante;
                resultado.Direction = ParameterDirection.Output;

                int result = proceso.ExecuteNonQuery();

                return int.Parse(resultado.Value.ToString());
            }

        }

        public string toString()
        {
            return this.nombre + " - " + this.Marca;
        }

    }


}
