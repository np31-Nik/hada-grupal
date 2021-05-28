using System;
using System.Collections.Generic;
using System.Data;
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
                    default:
                        Response.Redirect("~/Busqueda.aspx");
                        break;

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
            ENAnuncio en = new ENAnuncio();
            String comandoAnuncio = "WHERE ";
            String comandoCoche = "WHERE ";
            String comandoPropiedad = "WHERE ";
            DataSet ds = new DataSet();
            bool success = false;
            bool and = false;

            comandoAnuncio += "tipo ='" + TIPO_OPERACION.SelectedItem.Text + "'";

            if(PRECIO_DESDE.Text != null)
            {
                AnyadirAdd(ref and, ref comandoAnuncio);
                comandoAnuncio += "precio >= '" + PRECIO_DESDE.Text + "'";
                and = true;
            }


            if (PRECIO_HASTA.Text != null)
            {
                AnyadirAdd(ref and, ref comandoAnuncio);
                comandoAnuncio += "precio <= '" + PRECIO_HASTA.Text + "'";
                and = true;
            }

            if(LOCALIDAD.Text != null)
            {
                AnyadirAdd(ref and, ref comandoAnuncio);
                comandoAnuncio += "localidad = '" + LOCALIDAD.Text + "'";
                and = true;
            }

            if (comandoAnuncio == "WHERE ")
            {
                comandoAnuncio = "";
            }

            and = false;

            if (RB_Coche_Propiedad.SelectedItem.Text == "Coche")
            {
                if(TIPO_COCHE.SelectedItem.Text != "Elige...")
                {
                    comandoCoche += "tipo = '" + TIPO_COCHE.SelectedItem.Text;
                    and = true;
                }

                if(MARCA.SelectedItem.Text != "Elige...")
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoCoche += "marca = '" + MARCA.SelectedItem.Text + "'";
                    and = true;
                }

                if(comandoPropiedad=="WHERE ")
                {
                    comandoPropiedad = "";
                }

                ds = en.BusquedaAnuncios(comandoAnuncio, comandoPropiedad, ref success);

            }
            else if (RB_Coche_Propiedad.SelectedItem.Text == "Propiedad")
            {
                if(TIPO_PROPIEDAD.SelectedItem.Text != "Elige...")
                {
                    comandoPropiedad += "tipo = '" + TIPO_PROPIEDAD.SelectedItem.Text + "'";
                    and = true;
                }

                if (DORMITORIOS.Text != null)
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoPropiedad += "dorm = '" + DORMITORIOS.Text + "'";
                    and = true;
                }

                if (BANYOS.Text != null)
                {
                    AnyadirAdd(ref and, ref comandoAnuncio);
                    comandoPropiedad += "bano ='" + BANYOS.Text + "'";
                    and = true;
                }

                if (comandoCoche == "WHERE ")
                {
                    comandoCoche = "";
                }

                ds = en.BusquedaAnuncios(comandoAnuncio, comandoCoche,ref success);

            }

            if (success)
            {
                ListView1.DataSource = ds;
                ListView1.DataBind();
            }
            else
            {
                ListView1.DataSource = null;
                ListView1.DataBind();
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