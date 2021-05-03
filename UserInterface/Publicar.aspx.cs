using System;

namespace UserInterface
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //mensaje.Text = "elegiste: " + RadioButtonList1.SelectedItem.Text;
            if (RadioButtonList1.SelectedItem.Text == "Vehiculo")
            {
                vehiculo.Visible = true;
                propiedad.Visible = false;
            }
            else if (RadioButtonList1.SelectedItem.Text == "Propiedad")
            {
                precioProp.Text = "Precio: ";
                vehiculo.Visible = false;
                propiedad.Visible = true;
            }
        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList2.SelectedItem.Text == "Alquiler")
            {
                precioProp.Text = "Precio por mes:";
            }
            else if (RadioButtonList2.SelectedItem.Text == "Venta")
            {
                precioProp.Text = "Precio de venta:";
            }
        }

        protected void PublicarClick(object sender, EventArgs e)
        {
            mensaje.Text = "";
        }
        protected void InicioClick(object sender, EventArgs e)
        {
            mensaje.Text = "";
        }
    }
}
