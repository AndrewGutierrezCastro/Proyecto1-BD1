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
    public partial class CrearOrganizacion : UserControl
    {
        public CrearOrganizacion()
        {
            InitializeComponent();
        }

        public void limpiarBtn_Click(object sender, EventArgs e)
        {
            cedulaJuriTxtBox.Text = "";
            nombreTxtBox.Text = "";
            ciudadTxtBox.Text = "";
            numeroTxtBox.Text = "";
            direccionTxtBox.Text = "";
        }
    }
}
