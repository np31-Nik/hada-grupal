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
           
            if (Page.IsValid)
            {
                ENUsuario usuario = new ENUsuario();

                usuario.Email = email.Text;
                usuario.Contrasenya = contrasenya.Text;
                usuario.readUsuario();
                Session["nif"] =usuario.Nif;
                Session["nombre"] = usuario.Nombre;
                Session["apellido"] = usuario.Apellido;
                Session["email"] = usuario.Email;
                Session["telefono"] = usuario.Telefono;
                Session["premium"] = usuario.Premium;
                Session["admin"] = usuario.Admin;




                Response.Redirect("~/Perfil.aspx");
            }
        }
     }
}