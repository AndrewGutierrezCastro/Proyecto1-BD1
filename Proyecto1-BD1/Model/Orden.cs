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
        private string readOrdenes_sp = "ReadOrdenes";

      

        public static List<Orden> ordenesCargadas = new List<Orden>();

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

                comando.Parameters.AddWithValue("@TipoCliente", 0).Direction = ParameterDirection.Output;

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

            ordenesCargadas = data;
            return data;
        }

        public bool Create(SqlConnection connection)
        {

            using (SqlCommand comando = new SqlCommand(crearOrden_sp, connection))
            {
                comando.CommandType = System.Data.CommandType.StoredProcedure;

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
    }
}
