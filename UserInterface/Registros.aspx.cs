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

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                usuario.Admin = administrador;
                usuario.createUsuario();

                Session["nif"] = usuario.Nif;
                Session["nombre"] = usuario.Nombre;
                Session["apellido"] = usuario.Apellido;
                Session["email"] = usuario.Email;
                Session["telefono"] = usuario.Telefono;
                Session["premium"] = usuario.Premium;
                Session["admin"] = usuario.Admin;
            }
            try
            {

            }
            catch(Exception )
            {
                
            }
            Response.Redirect("Principal.aspx", false);
        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ENUsuario usuario = new ENUsuario();
            string nombre = NombreUsuario.Text;
            if (nombre != "")
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

                /*
                protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)

                {
                    ENUsuario usuario = new ENUsuario();
                    string contrasenya = Contraseña.Text;
                    if (contrasenya != "")
                    {
                        if (usuario.readUsuario(contrasenya))
                        {
                            args.IsValid = false;
                        }
                        else
                        {
                            args.IsValid = true;

                        }

                    }

                }
                */
        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ENUsuario usuario = new ENUsuario();
            string dniAuxiliar = nif.Text;
            if (dniAuxiliar != "")
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