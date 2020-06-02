using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto1_BD1
{
    public partial class CrearPersona : UserControl
    {
        public CrearPersona()
        {
            InitializeComponent();
        }

        public void limpiarBtn_Click(object sender, EventArgs e)
        {
            cedulaTxtBox.Text = "";
            nombreTxtBox.Text = "";
            apellidosTxtBox.Text = "";
            numeroTxtBox.Text = "";
            direccionTxtBox.Text = "";

        }
    }
}
