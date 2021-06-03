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
    public partial class Anuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["anuncio_id"] == null)
                {
                    Response.Redirect("~/Busqueda.aspx",false);
                }
                else
                {
                    ENAnuncio en = new ENAnuncio();
                    en.id = int.Parse(Request.QueryString["anuncio_id"]);
                    bool existe = en.readAnuncio();

                    if (!existe)
                    {
                       Response.Redirect("~/Busqueda.aspx", false);
                    }
                    else
                    {
                        REF.Text = en.id.ToString();
                        TITULO.Text = en.titulo;
                        PRECIO.Text = en.precio.ToString() + "€";
                        ENUsuario propietario = new ENUsuario();
                        propietario.Nif = en.usuario.Nif;
                        propietario.existeUsuario();
                        PROPIETARIO.Text = propietario.Nombre + " " + propietario.Apellido;
                        TELEFONO.Text = propietario.Telefono;
                        EMAIL.Text = propietario.Email;
                        LOCALIDAD.Text = en.localidad.localidad;
                        LOCALIDADH.Value = en.localidad.localidad;
                        DESCRIPCION.Text = en.descripcion;
                        CATEGORIAH.Value = en.categoria;
                        TIPO_ANUNCIO.Value = en.tipo.Tipo;
                        switch (en.categoria)
                        {
                            case "Coche":
                                INFO_COCHE.Visible = true;
                                INFO_PROPIEDAD.Visible = false;
                                ENCoche coche = new ENCoche();
                                coche.id = en.id;
                                coche.readCoche(coche);
                                ANYO.Text = coche.anyo.ToString();
                                MARCA.Text = coche.marca.companyia;
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

                        if (Session["nif"] != null)
                        {
                            PanelComentarioUsuario.Visible = true;
                            Mensaje_comentario.Visible = false;
                        }
                        else
                        {
                            Mensaje_comentario.Visible = true;
                            PanelComentarioUsuario.Visible = false;
                        }
                    }
                }
            }
        }
        protected void CalcularHipoteca(object sender, EventArgs e)
        {
            Page.Validate("Hipoteca");
            if (Page.IsValid)
            {
                ENHipoteca en = new ENHipoteca();
                en.BANCO = BANCO.SelectedItem.Text;
                en.FECHADESDE = int.Parse(H_ANYOS.Text);
                en.FECHAHASTA = int.Parse(H_ANYOS.Text);

                ENBanco banco = new ENBanco();
                banco.BANCO = BANCO.SelectedItem.Text;
                banco.readBanco();

                if (en.BuscarHipoteca())
                {
                    MensajeH.Visible = false;
                    H_RESULTADO.Visible = true;
                    H_INTERES.Text = en.INTERESES.ToString() + "%";

                    int precio = int.Parse(PRECIO.Text.TrimEnd('€'));
                    int anyos = int.Parse(H_ANYOS.Text);
                    int cuotam = ((precio / anyos) * en.INTERESES / 100 + (precio / anyos)) / 12;
                    H_CUOTAM.Text = cuotam.ToString() + " €";

                    TEL_BANCO.Text = banco.TELEFONO;
                    EMAIL_BANCO.Text = banco.EMAIL;
                }
                else
                {
                    H_RESULTADO.Visible = false;
                    MensajeH.Visible = true;
                }


            }
        }

        protected void Comentar(object sender, EventArgs e)
        {
            if (Session["nif"] != null && ComentarioUsuario.Text != "")
            {
                ENComentario en = new ENComentario();
                en.anuncio = int.Parse(REF.Text);
                en.user = Session["nif"].ToString();
                en.text = ComentarioUsuario.Text;
                en.createComentario();

                bool success = false;
                DataSet ds = new DataSet();
                ds = en.BuscarComentarios(REF.Text, ref success);

                ComentarioUsuario.Text = "";

                if (success)
                {
                    ListaComentarios.DataSourceID = null;
                    ListaComentarios.DataSource = ds;
                    ListaComentarios.DataBind();
                    ListaComentarios.DataSourceID = null;
                }

            }
            
        }

        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            DataPager dp = (DataPager)ListView1.FindControl("DataPager1");
            dp.Visible = (dp.PageSize < dp.TotalRowCount);
            dp.ApplyStyleSheetSkin(this);

        }

        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            int CurrentPage = 0;
            Int32.TryParse(Request.QueryString["page"], out CurrentPage);
            CurrentPage = CurrentPage.Equals(0) ? 1 : CurrentPage;
            DataPager dp = (DataPager)ListView1.FindControl("DataPager1");

            ImageButton PreviousLink = dp.Controls[0].Controls[0] as ImageButton;
            ImageButton NextLink = dp.Controls[1].Controls[1] as ImageButton;
            if (PreviousLink != null)
            {
                if (CurrentPage.Equals(1))
                {
                    PreviousLink.Visible = false;
                }
                else if (CurrentPage > 1)
                {
                    PreviousLink.Visible = true;
                }
            }
            if (NextLink != null)
            {
                if ((CurrentPage * dp.PageSize) >= dp.TotalRowCount)
                {
                    NextLink.Visible = false;
                }
                else
                {
                    NextLink.Visible = true;
                }
            }
        }

            protected void AnuncioSimilar(object sender, EventArgs e)
            {
                Response.Redirect("~/Anuncio.aspx?anuncio_id=" + ((ImageButton)sender).CommandArgument.ToString(), false);
            }

            protected void Similares(ENAnuncio en)
            {
                string cmd_A = "WHERE ";
                string cmd_B = "WHERE ";
                float precio_min, precio_max;
                string tabla = en.categoria;
                bool success = false;

                cmd_A += "tipo='" + en.tipo.Tipo + "' AND categoria='" + en.categoria + "' AND localidad='" + en.localidad.localidad + "' AND id<>'" + en.id + "'";

                switch (en.categoria)
                {
                    case "coche":
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
                        } else
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

                    case "propiedad":
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