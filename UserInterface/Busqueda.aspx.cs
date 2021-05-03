using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Busqueda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RB_Coche_Propiedad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RB_Coche_Propiedad.SelectedItem.Text == "Coche")
            {
                IF_PROPIEDAD.Visible = false;
                IF_COCHE.Visible = true;
            }
            else if (RB_Coche_Propiedad.SelectedItem.Text == "Propiedad")
            {
                IF_COCHE.Visible = false;
                IF_PROPIEDAD.Visible = true;
            }
        }
    }
}