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
    public partial class CrearOrden : UserControl
    {
        public CrearOrden()
        {
            InitializeComponent();
        }

        private void limpiarBtn_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        public void limpiar()
        {
            cedulaTxtBox.Text = "";
            isOrganizacionCheckBox.Checked = false;
        }
    }
}
