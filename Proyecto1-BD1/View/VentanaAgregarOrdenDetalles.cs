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
    public partial class VentanaAgregarOrdenDetalles : UserControl
    {
        public VentanaAgregarOrdenDetalles(MenuGeneral menu)
        {
            InitializeComponent();
            this.menu = menu;
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        bool validarNumero(TextBox campo)
        {

            try
            {
                int.Parse(campo.Text);
            } catch (FormatException e)
            {
                return false;
            }

            return true;
        }

        List<Model.OrdenDetalle> ordenDetalles = new List<Model.OrdenDetalle>();

        private void agregarOrdenDetalleBtn_Click(object sender, EventArgs e)
        {

            if (parteOrdenCmb.SelectedIndex != -1)
            {
                MessageBox.Show("Debe seleccionar una parte", "Informacion al usuario",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            } else if (ordenCmb.SelectedIndex != -1)
            {
                MessageBox.Show("Debe seleccionar una orden", "Informacion al usuario",
                   MessageBoxButtons.OK, MessageBoxIcon.Error);

            } else if (!validarNumero(cantidadTxt))
            {
                MessageBox.Show("Debe usar una cantidad entera", "Informacion al usuario",
                   MessageBoxButtons.OK, MessageBoxIcon.Error);

            } else
            {
                int cantidad = int.Parse(cantidadTxt.Text);

                /*
                 int cantidad, int idProveedor, 
                 int idOrden, decimal montoVenta,
                 decimal precioCobrado)*/

                int indice = 0;
                Modelo.Orden ordenSelecionada;

                if (ordenCmb.SelectedIndex > Modelo.Orden.ordenesCargadasP.Count)
                {
                    indice = ordenCmb.SelectedIndex - Modelo.Orden.ordenesCargadasP.Count;
                    ordenSelecionada = Modelo.Orden.ordenesCargadasO[indice];
                } else
                {
                    indice = ordenCmb.SelectedIndex;
                    ordenSelecionada = Modelo.Orden.ordenesCargadasP[indice];
                }

                Model.ProveedorPartes parteSeleccionada = Model.ProveedorPartes.proveedoresPartesCargadas[parteOrdenCmb.SelectedIndex];

                Model.OrdenDetalle orden = new Model.OrdenDetalle(
                            cantidad,
                            ordenSelecionada.Id,
                            parteSeleccionada.precio,
                            parteSeleccionada.precio * cantidad,
                            parteSeleccionada.nombreParte,
                            parteSeleccionada.nombreProveedor
                        );

                ordenDetalles.Add(
                   orden
                );

                this.ordenDetalleGrid.Rows.Add(
                    new Object[]
                    {
                        orden.NombreParte, 
                        orden.NombreProveedor,
                        orden.Cantidad,
                        orden.MontoVenta, 
                        orden.PrecioCobrado
                    }    
                );




            }


        }

        public MenuGeneral menu;

        private void cancelarOrdenDetalleBtn_Click(object sender, EventArgs e)
        {
            this.cantidadTxt.Text = "";
            this.ordenDetalles.Clear();
            this.ordenDetalleGrid.Rows.Clear();

            menu.loadProveedorPartes();
            menu.loadOrdenes();
            
        }

        private void registrarOrdenBtn_Click(object sender, EventArgs e)
        {

            // TODO: ligar cada una de las ordenesdetalle con la orden
            // ademas actualizar precios de orden y volver a cargar ordenes depues de 
            // registrar


        }

        private void parteOrdenCmb_SelectedIndexChanged(object sender, EventArgs e)
        {
      
        }
    }
}
