using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void controlbarra(object sender, ServerValidateEventArgs e)
        {

            e.IsValid = true;
            int prueba = 0;

            if (ref_id.Text != "" && int.TryParse(ref_id.Text.ToString(), out prueba) == false)
            {
                e.IsValid = false;
            }
            if (BoxNumeros2.Text != "" && int.TryParse(BoxNumeros.Text.ToString(), out prueba) == false)
            {
                e.IsValid = false;
            }
            if (BoxNumeros.Text != "" && int.TryParse(BoxNumeros2.Text.ToString(), out prueba) == false)
            {
                e.IsValid = false;
            }

        }

        protected void LupaBuscar_Click(object sender, ImageClickEventArgs e)
        {
            string direccion = "";

            if (Page.IsValid == true)
            {
                if (ref_id.Text != "")
                {
                    direccion += "~/Anuncio.aspx?anuncio_id=" + ref_id.Text.ToString();
                    Response.Redirect(direccion, false);
                }
                else
                {
                    direccion += "~/Busqueda.aspx?tipo=" + CasaoCoche.SelectedValue.ToString() + "&tipo_op=" + ALQoVENT.SelectedValue.ToString();

                    if (localidades.SelectedValue != "Localidad")
                    {
                        direccion += "&localidad=" + localidades.SelectedValue.ToString();
                    }
                    if (BoxNumeros.Text != "")
                    {
                        direccion += "&precio_min=" + BoxNumeros.Text.ToString();
                    }
                    if (BoxNumeros2.Text != "")
                    {
                        direccion += "&precio_max=" + BoxNumeros2.Text.ToString();
                    }

                    Response.Redirect(direccion, false);
                }
            }
        }
    }
}