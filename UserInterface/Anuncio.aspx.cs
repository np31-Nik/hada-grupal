﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library;

namespace UserInterface
{
    public partial class Anuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["anuncio_id"] == null)
                {
                    Response.Redirect("~/Busqueda.aspx");
                }
                else
                {
                    ENAnuncio en = new ENAnuncio();
                    en.id = int.Parse(Request.QueryString["anuncio_id"]);
                    bool existe = en.readAnuncio();

                    if (!existe)
                    {
                        Response.Redirect("~/Busqueda.aspx");
                    }
                    else
                    {
                        REF.Text = en.id.ToString();
                        TITULO.Text = en.titulo;
                        PRECIO.Text = en.precio.ToString() + "€";
                        ENUsuario propietario = new ENUsuario();
                        propietario.Nif = en.usuario.Nif;
                        propietario.readUsuario();
                        PROPIETARIO.Text = propietario.Nombre + " " + propietario.Apellido;
                        TELEFONO.Text = propietario.Telefono;
                        EMAIL.Text = propietario.Email;
                        LOCALIDAD.Text = en.localidad.localidad;
                        DESCRIPCION.Text = en.descripcion;

                        switch (en.categoria)
                        {
                            case "Coche":
                                INFO_COCHE.Visible = true;
                                INFO_PROPIEDAD.Visible = false;
                                ENCoche coche = new ENCoche();
                                coche.id = en.id;
                                coche.readCoche(coche);
                                ANYO.Text = coche.anyo.ToString();
                                MARCA.Text = coche.marca.tipo;
                                TIPO_COCHE.Text = coche.tipo.categoria;
                                break;
                            case "Propiedad":
                                INFO_COCHE.Visible = false;
                                INFO_PROPIEDAD.Visible = true;
                                ENPropiedad prop = new ENPropiedad();
                                prop.id = en.id;
                                prop.readPropiedad(prop);
                                REF_CAT.Text = prop.numCatastral;
                                SUPERFICIE.Text = prop.superficie.ToString();
                                DORMITORIOS.Text = prop.habitaciones.ToString();
                                BANYOS.Text = prop.banyos.ToString();
                                TIPO_PROPIEDAD.Text = prop.tipo.tipo;
                                break;
                        }

                        Similares(en);
                    }
                }
            }
        }
        protected void CalcularHipoteca(object sender,EventArgs e)
        {

        }

        protected void Comentar(object sender,EventArgs e)
        {

        }

        protected void AnuncioSimilar(object sender, EventArgs e)
        {
            Response.Redirect("~/Anuncio.aspx?anuncio_id=" + ((ImageButton)sender).CommandArgument.ToString());
        }

        protected void Similares(ENAnuncio en)
        {
            string cmd_A = "WHERE ";
            string cmd_B = "WHERE ";
            float precio_min, precio_max;
            string tabla = en.categoria;
            bool success = false;

            cmd_A += "tipo='" + en.tipo.Tipo + "' AND categoria='" + en.categoria + "' AND localidad='" + en.localidad.localidad + "' AND id<>'"+en.id+"'";

            switch (en.categoria)
            {
                case "Coche":
                    ENCoche coche = new ENCoche();
                    coche.id = en.id;
                    coche.readCoche(coche);

                    if (en.tipo.Tipo == "Venta") {
                        precio_min = en.precio - 10000;
                        precio_max = en.precio + 10000;
                        if (precio_min < 0)
                        {
                            precio_min = 0;
                        }
                    }else
                    {
                        precio_min = en.precio - 400;
                        precio_max = en.precio + 400;
                        if (precio_min < 0)
                        {
                            precio_min = 0;
                        }
                    }
                    
                    cmd_B += "precio>='" + precio_min + "' AND precio<='" + precio_max + "' AND tipo='" + coche.tipo.categoria + "'";
                    break;

                case "Propiedad":
                    ENPropiedad prop = new ENPropiedad();
                    prop.id = en.id;
                    prop.readPropiedad(prop);

                    if (en.tipo.Tipo == "Venta")
                    {
                        precio_min = en.precio - 25000;
                        precio_max = en.precio + 25000;
                        if (precio_min < 0)
                        {
                            precio_min = 0;
                        }
                    }
                    else
                    {
                        precio_min = en.precio - 400;
                        precio_max = en.precio + 400;
                        if (precio_min < 0)
                        {
                            precio_min = 0;
                        }
                    }
                    cmd_B += "precio>='" + precio_min + "' AND precio<='" + precio_max + "' AND tipo='" + prop.tipo.tipo + "'";

                    break;
            }
            DataSet ds = en.BusquedaAnuncios(cmd_A, cmd_B, tabla, ref success);
            ListViewSimilares.DataSourceID = null;
            ListViewSimilares.DataSource = ds;
            ListViewSimilares.DataBind();
            ListViewSimilares.DataSourceID = null;
        }
    }
}