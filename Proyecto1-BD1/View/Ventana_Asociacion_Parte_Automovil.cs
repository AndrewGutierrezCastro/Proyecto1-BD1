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
    public partial class Ventana_Asociacion_Parte_Automovil : UserControl
    {
        public Ventana_Asociacion_Parte_Automovil()
        {
            InitializeComponent();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void cargarDialogo()
        {

            // cargamos las partes

            foreach (Modelo.Parte parte in Modelo.Parte.PartesCargadas)
            {
                PartesCmb.Items.Add(
                    parte.toString()   
                );
            }

            // cargamos los tipos
            foreach (Model.Automovil auto in Model.Automovil.automovilesCargados)
            {
                TipoAutomovilCmb.Items.Add(
                    auto.toString()
                );
            }

            this.Show();

            Console.WriteLine("Yes");
        }

        private void asociarBtn_Click(object sender, EventArgs e)
        {
            // validar antes de asociar


            if (PartesCmb.SelectedIndex == -1)
            {
                MessageBox.Show("Debe seleccionar una parte para asociar", 
                    "Validacion", 
                    MessageBoxButtons.OK, 
                    MessageBoxIcon.Exclamation);
            } else if ( TipoAutomovilCmb.SelectedIndex == -1)
            {
                MessageBox.Show(
                    "Debe seleccionar un tipo de automovil para asociar",
                    "Validacion",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Exclamation);
            } else
            {

                // se han seleccionado las dos opciones
                Modelo.Parte parteSeleccionada = Modelo.Parte.PartesCargadas[PartesCmb.SelectedIndex];
                Model.Automovil automovilSeleccionado = Model.Automovil.automovilesCargados[TipoAutomovilCmb.SelectedIndex];

                int respuesta =
                    parteSeleccionada.LinkAutomovil(
                        ConectionBD.Instance,
                        automovilSeleccionado
                    );

                /*
	                POSIBLES RESPUESTAS
	                 0 = caso exitoso
	                -1 = parte no existente
	                -2 = automovil no existente
	                -3 = parte y automovil no existente
                */

                if (respuesta == -1)
                {

                    MessageBox.Show(
                    "La parte seleccionada no existe",
                    "Validacion",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);

                }
                else if (respuesta == -2)
                {
                    MessageBox.Show(
                  "Tipo de Automovil seleccionado no existe",
                  "Validacion",
                  MessageBoxButtons.OK,
                  MessageBoxIcon.Error);


                }
                else if (respuesta == -3)
                {
                    MessageBox.Show(
                 "Parte y tipo de automovil no existen",
                 "Validacion",
                 MessageBoxButtons.OK,
                 MessageBoxIcon.Error);



                }
                else
                {
                    MessageBox.Show(
                "Se ha asociado la parte con el tipo de automovil",
                "Informacion de usuario",
                MessageBoxButtons.OK,
                MessageBoxIcon.Information);


                }

            }
        }

        public void reset()
        {
            PartesCmb.Items.Clear();
            TipoAutomovilCmb.Items.Clear();
        }

        private void cancelarBtn_Click(object sender, EventArgs e)
        {
            this.Dispose();

        }
    }
}
