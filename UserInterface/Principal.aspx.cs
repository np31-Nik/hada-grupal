﻿using System;
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

        protected void controlbarra(object sender,ServerValidateEventArgs e)
        {
            e.IsValid = true;
            int prueba = 0;

            if (@ref.Text != null && int.TryParse(@ref.Text.ToString(), out prueba) == false) 
            {
                e.IsValid = false;
            }
            if (BoxNumeros2.Text != null && int.TryParse(BoxNumeros.Text.ToString(), out prueba) == false) 
            {
                e.IsValid = false;
            }
            if (BoxNumeros.Text != null && int.TryParse(BoxNumeros2.Text.ToString(), out prueba) == false) 
            {
                e.IsValid = false;
            }
        }

        protected void clickLupa(System.Web.UI.ImageClickEventArgs e)
        {
            string direccion = "";
            
            if (Page.IsValid == true) 
            {
                if (@ref.Text != null) 
                {
                    direccion += "~/Anuncio.aspx?anuncio_id=" + @ref.Text.ToString();
                    Response.Redirect(direccion);
                }
                else 
                {
                    direccion += "~/Busqueda.aspx?tipo=" + CasaoCoche.SelectedValue.ToString() + "&tipo_op=" + ALQoVENT.SelectedValue.ToString();

                    if (localidades.SelectedValue != "Localidad") 
                    {
                        direccion += "&localidad=" + localidades.SelectedValue.ToString();
                    }
                    if (BoxNumeros.Text != null)
                    {
                        direccion += "&precio_min=" + BoxNumeros.Text.ToString();
                    }
                    if (BoxNumeros2.Text != null)
                    {
                        direccion += "&precio_max=" + BoxNumeros2.Text.ToString();
                    }

                    Response.Redirect(direccion);
                }
            }
        }

        protected void Oferta1(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta2(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta3(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta4(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta5(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta6(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta7(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta8(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta9(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
        protected void Oferta10(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx");

        }
    }
}