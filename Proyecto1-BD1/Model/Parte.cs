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
        public static String mostrarPartes_sp = "ReadPartes";
        public static String deletePartes_sp  = "DeleteParte";

        // atributos
        private string nombre, marca, nombreFabricante, detalleAutomovil;
        private int id;

        public static List<Parte> PartesCargadas;
        public static List<Parte> PartesXProveedorCargadas;
        public static List<Parte> PartesXAutomovilCargadas;

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

        public static List<Parte> loadDataByAutomovil(SqlConnection connection, int automovilId)
        {
            List<Parte> data = new List<Parte>();

            using (SqlCommand proceso = new SqlCommand(mostrarPartes_sp, connection))
            {
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

            PartesXAutomovilCargadas = data;

            return data;
        }


        public static List<Parte> LoadData( SqlConnection connection )
        {
            List<Parte> data = new List<Parte>();

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
                            (string) lector["nombreFabricante"],
                            (string) lector["detalle"]
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

        public string toString()
        {
            return this.nombre + " - " + this.Marca;
        }

    }


}
