using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace Proyecto1_BD1.Modelo
{
    class Orden
    {
        private string crearOrden_sp = "CreateOrden";
        private string updateIva_sp = "UpdateOrdenMontoIva";
        private string registrarOrdenesDetalles_sp = "CrearOrdenDetalle";
        private static string readOrdenes_sp = "ReadOrdenes";

        public static List<Orden> ordenesCargadasP = new List<Orden>();
        public static List<Orden> ordenesCargadasO = new List<Orden>();
        
        private int tipoCliente, id, numeroConsecutivo;
        private string cedulaCliente, nombreCliente;
        private DateTime fechaEmitida;
        private decimal montoVenta, montoIva, montoCobrado;

        public Orden(int tipoCliente, string cedulaCliente, DateTime fechaEmitida, decimal montoVenta, decimal montoIva, decimal montoCobrado)
        {
            TipoCliente = tipoCliente;
            CedulaCliente = cedulaCliente ?? throw new ArgumentNullException(nameof(cedulaCliente));
            FechaEmitida = fechaEmitida;
            MontoVenta = montoVenta;
            MontoIva = montoIva;
            MontoCobrado = montoCobrado;
        }

          
        public int NumeroConsecutivo { get => numeroConsecutivo; set => numeroConsecutivo = value; }
        public int Id { get => id; set => id = value; }
        public int TipoCliente { get => tipoCliente; set => tipoCliente = value; }
        public string CedulaCliente { get => cedulaCliente; set => cedulaCliente = value; }
        public string NombreCliente { get => nombreCliente; set => nombreCliente = value; }
        public DateTime FechaEmitida { get => fechaEmitida; set => fechaEmitida = value; }
        public decimal MontoVenta { get => montoVenta; set => montoVenta = value; }
        public decimal MontoIva { get => montoIva; set => montoIva = value; }
        public decimal MontoCobrado { get => montoCobrado; set => montoCobrado = value; }

        /*
          O.Id, 
          O.NumeroConsecutivo, 
          O.FechaEmitida, 
          C.Nombre, 
          Org.Nombre,
          O.MontoVenta, 
          O.MontoIva, 
          O.MontoCobrado 
      */

        public Orden(int id, int numeroConsecutivo, DateTime fechaEmitida, 
            string nombreCliente, string cedulaCliente, decimal montoVenta, decimal montoIva, decimal montoCobrado )
        {

            this.id = id;
            this.numeroConsecutivo = numeroConsecutivo;
            this.fechaEmitida = fechaEmitida;
            this.nombreCliente = nombreCliente;
            this.cedulaCliente = cedulaCliente;
            this.montoVenta = montoVenta;
            this.montoIva = montoIva;
            this.montoCobrado = montoCobrado;

        }

        public static List<Orden> loadData(int tipo)
        {
            List<Orden> data = new List<Orden>();

            SqlConnection connection = ConectionBD.Instance;
            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(readOrdenes_sp, connection))
            {
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@TipoCliente", tipo);

                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    data.Add(
                        new Orden(
                            (int)      lector["Id"],
                            (int)      lector["NumeroConsecutivo"],
                            (DateTime) lector["FechaEmitida"],
                            (string)   lector["Nombre"],
                            (string)   lector["Cedula"],
                            (decimal)  lector["MontoVenta"],
                            (decimal)  lector["MontoIva"],
                            (decimal)  lector["MontoCobrado"]
                        )
                    );
                }
            }
            
            if (tipo == 0)
                ordenesCargadasP = data;
            else
                ordenesCargadasO = data;

            return data;
        }

        public int registrarOrdenesDetalles(List<Model.OrdenDetalle> ordenesDetalles)
        {
            int rest = 0;
            bool success = false ;

            SqlConnection connection = ConectionBD.Instance;
            connection.Close();
            connection.Open();

            using (SqlCommand comando = new SqlCommand(updateIva_sp, connection))
            {
                /*@IdOrden int,
                @MontoIva decimal,
                @ResultadoOperacion int OUTPUT*/
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@IdOrden", this.id);
                comando.Parameters.AddWithValue("@MontoIva", this.montoIva);

                SqlParameter respuesta = comando.Parameters.AddWithValue("@ResultadoOperacion", 0);

                respuesta.Direction = ParameterDirection.Output;

                int res = comando.ExecuteNonQuery();
                success = int.Parse(respuesta.Value.ToString()) == 0;

            }


            if (success)
            {
                connection.Close();
                connection.Open();

                // registrar orden detalles
                bool ordDetallesSuccess = false;

                foreach (Model.OrdenDetalle ord in ordenesDetalles)
                {
                    ordDetallesSuccess = ord.Create(connection);

                    if (!ordDetallesSuccess)
                    {
                        return -500; // error al subir orden detalle
                    }
                    connection.Close();
                    connection.Open();
                }

            } else
            {
                MessageBox.Show("No se identifico la orden", "Informacion de usuario", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
                return -100; // error al modificar orden iva
            

        }

        public bool Create(SqlConnection connection)
        {

            using (SqlCommand comando = new SqlCommand(crearOrden_sp, connection))
            {
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Close();
                connection.Open();

                // definicion de parametros
                SqlParameter tipoCliente = comando.Parameters.Add("@TipoCliente", SqlDbType.Int);
                SqlParameter cedulaCliente = comando.Parameters.Add("@CedulaCliente", SqlDbType.Int);
                SqlParameter fechaEmitida = comando.Parameters.Add("@FechaEmitida", SqlDbType.DateTime);
                SqlParameter montoVenta = comando.Parameters.Add("@MontoVenta", SqlDbType.Decimal);
                SqlParameter montoIva = comando.Parameters.Add("@MontoIva", SqlDbType.Decimal);
                SqlParameter montoCobrado = comando.Parameters.Add("@MontoCobrado", SqlDbType.Decimal);
                SqlParameter resultadoOperacion = comando.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                // establecer valores
                tipoCliente.Value = this.tipoCliente;
                cedulaCliente.Value = this.cedulaCliente;
                montoVenta.Value = this.montoVenta;
                montoIva.Value = this.MontoIva;
                montoCobrado.Value = this.montoCobrado;
                fechaEmitida.Value = this.fechaEmitida;

                // parametro de salida
                resultadoOperacion.Direction = ParameterDirection.Output;

                // ejecucion
                int success = comando.ExecuteNonQuery();

                int respuesta = int.Parse(resultadoOperacion.Value.ToString());

                /*
                  POSIBLES RESPUESTAS
                  0  = caso exitoso
                  -1 = cliente no existente
                  -2 = fecha invalida
              */

                if (respuesta == -1)
                {
                    MessageBox.Show(
                       " Cliente dado no existe ",
                       " Accion no realizada ",
                       MessageBoxButtons.OK,
                       MessageBoxIcon.Error);
                }
                else if (respuesta == -2)
                {
                    MessageBox.Show(
                       " Fecha no es valida ",
                       " Accion no realizada ",
                       MessageBoxButtons.OK,
                       MessageBoxIcon.Error);
                }
                else
                {
                    return true;
                }

                return false;
            }
        }

        public string toString()
        {
            return this.numeroConsecutivo + " " + this.cedulaCliente + " " + this.fechaEmitida.ToString();
        }
    }
}
