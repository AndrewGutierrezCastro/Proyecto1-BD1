using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto1_BD1.Model
{   
    class FuncionesOrdenes
    {
        private DataTable tablaProveedores;
        private List<Proveedor> proveedores;
        private SqlConnection conexionSqlBd;
        private ConectionBD conectionBD;

        public FuncionesOrdenes()
        {
        }

        public DataTable TablaProveedores { get => tablaProveedores; set => tablaProveedores = value; }
        internal List<Proveedor> Proveedores { get => proveedores; set => proveedores = value; }
        public SqlConnection ConexionSqlBd { get => conexionSqlBd; set => conexionSqlBd = value; }
        public ConectionBD ConectionBD { get => conectionBD; set => conectionBD = value; }

        public int LocalizarProveedores(String[] parte)
        {
            proveedores = new List<Proveedor>();
            tablaProveedores = new DataTable();
            if (parte[0] != "")
            {
                /*
                @Cedula nchar(32),
                @Nombre nchar(128),
                @Direccion nchar(256),
                @Numero nchar(24),
                @Estado nchar(10),
                    */
                String[] parametros = new string[] { "@NombreParte" };

                int respuestaOperacion = conectionBD.EjecutarProcedimientoAlmacenado("UpdatePersona", parametros, parte, conexionSqlBd);

                return respuestaOperacion;
            }
            else
            {
                return -1;
            }

            
            
        }
    }
}
