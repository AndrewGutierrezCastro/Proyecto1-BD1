using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto1_BD1
{
    class Persona : Cliente
    {
        private String cedula;
        private String nombre;
        private String direccion;
        private String numero;
        public Persona(string pEstado, string cedula, string nombre, string direccion, string numero) : base(pEstado)
        {
            /*
             Este constructor crea una persona y la retorna, siempre y cuando un parametro no sea nulo.
             De ser asi se retorna un excepcion ArgumentNullException
             */
            this.Cedula = cedula ?? throw new ArgumentNullException(nameof(cedula));
            this.Nombre = nombre ?? throw new ArgumentNullException(nameof(nombre));
            this.Direccion = direccion ?? throw new ArgumentNullException(nameof(direccion));
            this.Numero = numero ?? throw new ArgumentNullException(nameof(numero));
        }

        public string Cedula { get => cedula; set => cedula = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Numero { get => numero; set => numero = value; }
    }
}
