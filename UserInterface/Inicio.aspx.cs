using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library;

namespace UserInterface
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserNameReq(object sender, EventArgs e)
        {

        }
        protected void EntrarClick(object sender, EventArgs e)
        {
            string email = nombreUsuario.Text;
            if (Page.IsValid)
            {
                ENUsuario usuario = new ENUsuario();
                usuario.Email = nombreUsuario.Text;
                Session["inicio"] = usuario;



                Response.Redirect("~/Perfil.aspx");
            }
        }

       

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ENUsuario usuario = new ENUsuario();
            string email = nombreUsuario.Text;
            if (email != "")
            {
                if (usuario.readUsuario())
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;

                }
            }

        }

    }
}