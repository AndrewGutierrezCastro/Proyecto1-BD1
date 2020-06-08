using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace Proyecto1_BD1.Model
{
    class OrdenDetalle
    {
        private string crearOrdenDetalle_sp = "CreateOrdenDetalle";

        private int cantidad, idOrden, idProveedorParte;
        private decimal montoVenta, precioCobrado;
        private string nombreParte, nombreProveedor;

        public int Cantidad { get => cantidad; set => cantidad = value; }
        public int IdProveedor { get => idProveedorParte; set => idProveedorParte = value; }
        public int IdOrden { get => idOrden; set => idOrden = value; }
        public decimal MontoVenta { get => montoVenta; set => montoVenta = value; }
        public decimal PrecioCobrado { get => precioCobrado; set => precioCobrado = value; }

        public string NombreParte { get => nombreParte; set => nombreParte = value; }
        public string NombreProveedor { get => nombreProveedor; set => nombreProveedor = value; }

        public OrdenDetalle(int cantidad, int idOrden, decimal montoVenta, decimal precioCobrado, string nombreParte, string nombreProveedor)
        {
            Cantidad = cantidad;
            IdOrden = idOrden;
            MontoVenta = montoVenta;
            PrecioCobrado = precioCobrado;
            this.nombreParte = nombreParte;
            this.NombreProveedor = NombreProveedor;
        }

        public OrdenDetalle(int cantidad, int idOrden, int idProveedorParte, decimal montoVenta, decimal precioCobrado, string nombreParte, string nombreProveedor)
        {
            Cantidad = cantidad;
            IdOrden = idOrden;
            MontoVenta = montoVenta;
            this.idProveedorParte = idProveedorParte;
            PrecioCobrado = precioCobrado;
            this.nombreParte = nombreParte;
            this.NombreProveedor = NombreProveedor;
        }

        public OrdenDetalle(int cantidad, int idProveedor, int idOrden, decimal montoVenta, decimal precioCobrado)
        {
            Cantidad = cantidad;
            IdProveedor = idProveedor;
            IdOrden = idOrden;
            MontoVenta = montoVenta;
            PrecioCobrado = precioCobrado;
        }

        public bool Create(SqlConnection connection)
        {

            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
                connection.Open();
            }
            else
            {
                connection.Open();
            }

            using (SqlCommand comando = new SqlCommand(crearOrdenDetalle_sp, connection))
            {
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                // definicion de parametros
                SqlParameter idOrden = comando.Parameters.Add("@IdOrden", SqlDbType.Int);
                SqlParameter idProveedorParte = comando.Parameters.Add("@IdProveedorParte", SqlDbType.Int);
                SqlParameter cantidad = comando.Parameters.Add("@Cantidad", SqlDbType.Int);
                SqlParameter montoVenta = comando.Parameters.Add("@MontoVenta", SqlDbType.Decimal);
                SqlParameter precioCobrado = comando.Parameters.Add("@PrecioCobrado", SqlDbType.Decimal);
                SqlParameter resultadoOperacion = comando.Parameters.Add("@RespuestaOperacion", SqlDbType.Int);

                // establecer valores
                idOrden.Value = this.IdOrden;
                idProveedorParte.Value = this.idProveedorParte;
                cantidad.Value = this.cantidad;
                montoVenta.Value = this.montoVenta;
                precioCobrado.Value = this.precioCobrado;

                // parametro de salida
                resultadoOperacion.Direction = ParameterDirection.Output;

                // ejecucion
                int success = comando.ExecuteNonQuery();

                int respuesta = int.Parse( resultadoOperacion.Value.ToString() );

                /*
		            POSIBLES RESPUESTAS:
		            0  = caso exitoso
		            -1 = orden no existente, 
		            -2 = proveedor no existente
	            */

                if (respuesta == -1)
                {
                    MessageBox.Show(
                       " Orden dada no existe ",
                       " Accion no realizada ",
                       MessageBoxButtons.OK,
                       MessageBoxIcon.Error);
                }
                else if (respuesta == -2)
                {
                    MessageBox.Show(
                       " Proveedor no existe ",
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
