using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Proyecto1_BD1.Model
{
    class Automovil
    {
        public static string readAutomoviles_sp = "ReadAutomoviles";

        private int id;
        private string detalle, anno, nombreFabricante, modelo;

        public static List<Automovil> automovilesCargados;

        public int Id { get => id; set => id = value; }
        public string Detalle { get => detalle; set => detalle = value; }
        public string Anno { get => anno; set => anno = value; }
        public string NombreFabricante { get => nombreFabricante; set => nombreFabricante = value; }
        public string Modelo { get => modelo; set => modelo = value; }

        public Automovil(int id, string detalle, string anno, string nombreFabricante, string modelo)
        {
            this.id = id;
            this.detalle = detalle ?? throw new ArgumentNullException(nameof(detalle));
            this.anno = anno ?? throw new ArgumentNullException(nameof(anno));
            this.nombreFabricante = nombreFabricante ?? throw new ArgumentNullException(nameof(nombreFabricante));
            this.modelo = modelo ;
        }

        public string toString()
        {
            return this.detalle + " - " + this.anno;
        }

        public static List<Automovil> loadData(SqlConnection connection)
        {
            List<Automovil> data = new List<Automovil>();

            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(readAutomoviles_sp, connection))
            {
                comando.CommandType = CommandType.StoredProcedure;

                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Automovil(
                            (int) lector["Id"],
                            (string) lector["Detalle"],
                            (string) lector["Anno"],
                            (string) lector["NombreFabricante"],
                            (string) lector["Modelo"]

                     ));
                }


            }

            automovilesCargados = data;
            return data;
        }



    }
}
