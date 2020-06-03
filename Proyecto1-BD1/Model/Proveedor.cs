using System;

namespace Proyecto1_BD1.Model
{
    class Proveedor
    {
        private int codigo;
        private String nombre;

        public Proveedor(int codigo, string nombre)
        {
            this.codigo = codigo;
            this.nombre = nombre ?? throw new ArgumentNullException(nameof(nombre));
        }

        public int Codigo { get => codigo; set => codigo = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}
