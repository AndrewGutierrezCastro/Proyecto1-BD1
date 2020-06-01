using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto1_BD1
{
    class Cliente
    {
        private String estado;

        public Cliente(string pEstado)
        {
            Estado = pEstado;
        }

        public string Estado { get => estado; set => estado = value; }

    }
}
