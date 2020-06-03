using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto1_BD1.View
{
    public partial class VentanaInsertarParte : UserControl
    {
        public VentanaInsertarParte()
        {
            InitializeComponent();
        }

        public void reset()
        {
            this.fabricanteTxt.Clear();
            this.marcaTxt.Clear();
            this.nombreTxt.Clear();
        }

        private void guardarParteBtn_Click(object sender, EventArgs e)
        {

            string nombre = nombreTxt.Text;
            string marca = marcaTxt.Text;
            string fabricante = fabricanteTxt.Text;


            Modelo.Parte nuevaParte = new Modelo.Parte(0, nombre, marca, fabricante);

            int resultado = nuevaParte.createParte(ConectionBD.Instance);

            /*
	            POSIBLES RESPUESTAS
	             0 = caso exitoso
	            -1 = nombre invalido
	            -2 = marca invalida
	            -3 = nombreFabricante invalido
	            -4 = automovil no existente
	        */

            if (resultado == -1)
            {
                MessageBox.Show("Nombre invalido", "Validacion", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (resultado == -2)
            {
                MessageBox.Show( "Marca invalido", "Validacion", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (resultado == -3)
            {
                MessageBox.Show( "Nombre de fabricante invalido", "Validacion", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } else
            {

                MessageBox.Show(" Se ha insertado el nuevo cliente ", "Informacion a usuario", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Proyecto1_BD1.ConectarServidorForm.menu.refreshPartes();


            }


        }

        private void cancelarBtn_Click(object sender, EventArgs e)
        {
            reset();
        }
    }
}
