using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library;

namespace UserInterface
{
    public partial class Registros : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nif"] != null)
            {
                Response.Redirect("~/Principal.aspx", false);
            }
        }
        protected void RegistarClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool administrador = false;
                ENUsuario usuario = new ENUsuario();
                usuario.Nif = nif.Text;
                usuario.Nombre = NombreUsuario.Text;
                usuario.Apellido = apellidos.Text;
                usuario.Email = email.Text;
                usuario.Contrasenya = Contraseña.Text;
                usuario.Telefono = movil.Text;
                usuario.Admin = administrador;
                if (usuario.createUsuario())
                {
                    Session["nif"] = usuario.Nif;
                    Session["nombre"] = usuario.Nombre;
                    Session["apellido"] = usuario.Apellido;
                    Session["email"] = usuario.Email;
                    Session["telefono"] = usuario.Telefono;
                    Session["premium"] = usuario.Premium;
                    Session["admin"] = usuario.Admin;
                    Response.Redirect("Perfil.aspx", false);
                }
                else
                {
                    mensaje.Visible = true;
                }
            }
        }       
     }
}