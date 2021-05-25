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
        private object administrador;

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
                ENUsuario usuario = new ENUsuario();
                usuario.Nif = nif.Text;
                usuario.Nombre = NombreUsuario.Text;
                usuario.Apellido = apellidos.Text;
                usuario.Email = email.Text;
                usuario.Contrasenya = Contraseña.Text;
                //usuario.Telefono =  movil.Text;
                //usuario.Admin = administrador;
                usuario.createUsuario();


            }
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
     }
}