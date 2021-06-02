﻿using System;
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

                usuario.Nif = nif.Text;
                usuario.Contrasenya = seguridad.Text;
                usuario.readUsuario();
                Session["inicio"] = usuario;
                Session["nif"] =usuario.Nif;
                Session["nombre"] = usuario.Nombre;
                Session["apellidos"] = usuario.Apellido;
                Session["telefono"] = usuario.Telefono;
                Session["premium"] = usuario.Premium;
                Session["administrador"] = usuario.Admin;




                Response.Redirect("~/Perfil.aspx");
            }
        }



        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
            if (nif.Text != "" && seguridad.Text != "")
            {
                ENUsuario usuario = new ENUsuario();
                usuario.Contrasenya= seguridad.Text;

                if (Convert.ToBoolean(usuario.readUsuario()))
                {

                    if (usuario.Nif != nif.Text)
                    {
                        args.IsValid = true;
                    }
                    else
                    {
                        args.IsValid = false;

                    }
                }

            }
        }

       



     }
}