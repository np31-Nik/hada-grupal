using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
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

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Page.DataBind();
                string tipo = Request.QueryString["tipo"];
                switch (tipo)
                {
                    case "coches":
                        RB_Coche_Propiedad.SelectedIndex = 0;
                        RB_Coche_Propiedad_SelectedIndexChanged(null, null);
                        break;
                    case "propiedades":
                        RB_Coche_Propiedad.SelectedIndex = 1;
                        RB_Coche_Propiedad_SelectedIndexChanged(null, null);
                        break;
                    default:
                        break;

                }
                string tipo_op = Server.UrlDecode(Request.QueryString["tipo_op"]);
                if (TIPO_OPERACION.Items.FindByText(tipo_op) != null)
                {
                    TIPO_OPERACION.SelectedValue = tipo_op;
                    TIPO_OPERACION.SelectedItem.Text = tipo_op;
                }
                else
                {
                    TIPO_OPERACION.SelectedIndex = 2;
                }


                string localidad = Server.UrlDecode(Request.QueryString["localidad"]);
                if (LOCALIDAD.Items.Contains(new ListItem(localidad)))
                {
                    LOCALIDAD.SelectedValue = localidad;
                }

                string precio_min = Server.UrlDecode(Request.QueryString["precio_min"]);
                PRECIO_DESDE.Text = precio_min;

                string precio_max = Server.UrlDecode(Request.QueryString["precio_max"]);
                PRECIO_HASTA.Text = precio_max;

                BuscarAnuncios(null, null);
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
            Page.Validate("Buscar");
            if (Page.IsValid)
            {
                ENAnuncio en = new ENAnuncio();
                String comandoAnuncio = "WHERE ";
                String comandoCoche = "WHERE ";
                String comandoPropiedad = "WHERE ";
                DataSet ds = new DataSet();
                bool success = false;
                bool and = false;

                comandoAnuncio += "tipo='" + TIPO_OPERACION.SelectedItem.Text + "'";
                and = true;

                if (PRECIO_DESDE.Text.Length != 0)
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoAnuncio += "precio>='" + PRECIO_DESDE.Text + "'";
                    and = true;
                }


                if (PRECIO_HASTA.Text.Length != 0)
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoAnuncio += "precio<='" + PRECIO_HASTA.Text + "'";
                    and = true;
                }

                if (LOCALIDAD.Text.Length != 0)
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoAnuncio += "localidad='" + LOCALIDAD.Text + "'";
                    and = true;
                }

                if (comandoAnuncio == "WHERE ")
                {
                    comandoAnuncio = "";
                }

                and = false;

                if (string.Compare(RB_Coche_Propiedad.SelectedItem.Text, "Coche") == 0)
                {
                    if (TIPO_COCHE.SelectedItem.Text != "Elige...")
                    {
                        comandoCoche += "tipo='" + TIPO_COCHE.SelectedItem.Text;
                        and = true;
                    }

                    if (MARCA.SelectedItem.Text != "Elige...")
                    {
                        AnyadirAdd(ref and, ref comandoCoche);
                        comandoCoche += "marca='" + MARCA.SelectedItem.Text + "'";
                        and = true;
                    }

                    if (comandoCoche == "WHERE ")
                    {
                        comandoCoche = "";
                    }

                    ds = en.BusquedaAnuncios(comandoAnuncio, comandoCoche,"Coche", ref success);

                }
                else if (string.Compare(RB_Coche_Propiedad.SelectedItem.Text, "Propiedad") == 0)
                {
                    if (TIPO_PROPIEDAD.SelectedItem.Text != "Elige...")
                    {
                        comandoPropiedad += "tipo='" + TIPO_PROPIEDAD.SelectedItem.Text + "'";
                        and = true;
                    }

                    if (DORMITORIOS.Text.Length != 0)
                    {
                        AnyadirAdd(ref and, ref comandoPropiedad);
                        comandoPropiedad += "dorm='" + DORMITORIOS.Text + "'";
                        and = true;
                    }

                    if (BANYOS.Text.Length != 0)
                    {
                        AnyadirAdd(ref and, ref comandoPropiedad);
                        comandoPropiedad += "bano='" + BANYOS.Text + "'";
                        and = true;
                    }

                    if (comandoPropiedad == "WHERE ")
                    {
                        comandoPropiedad = "";
                    }

                    ds = en.BusquedaAnuncios(comandoAnuncio, comandoPropiedad,"Propiedad", ref success);

                }

                ListView1.DataSourceID = null;
                ListView1.DataSource = ds;
                ListView1.DataBind();
                ListView1.DataSourceID = null;
            }
            

        }

        private void AnyadirAdd(ref bool add,ref string cmd)
        {
            if (add)
            {
                cmd+= " AND ";
                add = false;
            }
        }
    }
}