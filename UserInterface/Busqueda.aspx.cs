﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library;

namespace UserInterface
{
    public partial class Busqueda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                /*
                 * ENTipoPropiedad TP = new ENTipoPropiedad();
                TP.readFirstTipoPropiedad();
                TIPO_OPERACION.Items.Add(TP.tipo);
               while (TP.readNextTipoPropiedad())
                {
                    TIPO_OPERACION.Items.Add(TP.tipo);
                }
                */

                string tipo_busqueda = Request.QueryString["tipo"];
                switch (tipo_busqueda)
                {
                    case "coches":
                        RB_Coche_Propiedad.SelectedIndex = 0;
                        RB_Coche_Propiedad_SelectedIndexChanged(null, null);
                        return;
                    case "propiedades":
                        RB_Coche_Propiedad.SelectedIndex = 1;
                        RB_Coche_Propiedad_SelectedIndexChanged(null, null);
                        return;
                }

            }

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

        protected void BuscarAnuncios(object sender, EventArgs e)
        {
            ListView1 = new ListView();
        }
    }
}