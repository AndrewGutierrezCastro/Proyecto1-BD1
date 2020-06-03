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
    public partial class LocalizarProveedor : UserControl
    {
        public LocalizarProveedor()
        {
            InitializeComponent();
        }

        public void limpiarBtn_Click(object sender, EventArgs e)
        {
            nombrePartesComboBox.SelectedIndex = 0;
            proveedorDataGridView.Rows.Clear();
            

        }
    }
}
