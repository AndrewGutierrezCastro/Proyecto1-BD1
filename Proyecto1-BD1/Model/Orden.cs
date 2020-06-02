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

        private int tipoCliente;
        private string cedulaCliente;
        private DateTime fechaEmitida;
        private decimal montoVenta, montoIva, montoCobrado;
           
        public int TipoCliente { get => tipoCliente; set => tipoCliente = value; }
        public string CedulaCliente { get => cedulaCliente; set => cedulaCliente = value; }
        public DateTime FechaEmitida { get => fechaEmitida; set => fechaEmitida = value; }
        public decimal MontoVenta { get => montoVenta; set => montoVenta = value; }
        public decimal MontoIva { get => montoIva; set => montoIva = value; }
        public decimal MontoCobrado { get => montoCobrado; set => montoCobrado = value; }

        public bool Create(SqlConnection connection)
        {

            using (SqlCommand comando = new SqlCommand(crearOrden_sp, connection))
            {
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                // definicion de parametros
                SqlParameter tipoCliente = comando.Parameters.Add("@TipoCliente", SqlDbType.Int);
                SqlParameter cedulaCliente = comando.Parameters.Add("@CedulaCliente", SqlDbType.Int);
                SqlParameter fechaEmitida = comando.Parameters.Add("@FechaEmitida", SqlDbType.Int);
                SqlParameter montoVenta = comando.Parameters.Add("@MontoVenta", SqlDbType.Decimal);
                SqlParameter montoIva = comando.Parameters.Add("@MontoIva", SqlDbType.Decimal);
                SqlParameter montoCobrado = comando.Parameters.Add("@MontoCobrado", SqlDbType.Decimal);
                SqlParameter resultadoOperacion = comando.Parameters.Add("@ResultadoOperacion", SqlDbType.int);

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
