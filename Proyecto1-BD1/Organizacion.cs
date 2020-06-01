using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto1_BD1
{
    class Organizacion : Cliente
    {
        private String cedulaJuridica;
        private String nombre;
        private String ciudad;
        private String direccion;
        private String nombreContacto;
        private String cargoContanto;
        private String numero;
        

        public Organizacion(string pEstado, string cedulaJuridica, string nombre, string ciudad, string direccion,  string nombreContacto, string cargoContanto, string numero) : base( pEstado )
        {
            /*
             Este constructor crea una organizacion y la retorna, siempre y cuando un parametro no sea nulo.
             De ser asi se retorna un excepcion ArgumentNullException
             */
            this.cedulaJuridica = cedulaJuridica ?? throw new ArgumentNullException(nameof(cedulaJuridica));
            this.nombre = nombre ?? throw new ArgumentNullException(nameof(nombre));
            this.direccion = direccion ?? throw new ArgumentNullException(nameof(direccion));
            this.ciudad = ciudad ?? throw new ArgumentNullException(nameof(ciudad));
            this.nombreContacto = nombreContacto ?? throw new ArgumentNullException(nameof(nombreContacto));
            this.cargoContanto = cargoContanto ?? throw new ArgumentNullException(nameof(cargoContanto));
            this.numero = numero ?? throw new ArgumentNullException(nameof(numero));
        }

        public string CedulaJuridica { get => cedulaJuridica; set => cedulaJuridica = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Ciudad { get => ciudad; set => ciudad = value; }
        public string NombreContacto { get => nombreContacto; set => nombreContacto = value; }
        public string CargoContanto { get => cargoContanto; set => cargoContanto = value; }
        public string Numero { get => numero; set => numero = value; }
    }
}
