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
                    Response.Redirect("~/Principal.aspx");
                }
                else
                {
                    ENAnuncio en = new ENAnuncio();
                    en.id = int.Parse(Request.QueryString["anuncio_id"]);
                    bool existe = en.readAnuncio();

                    if (!existe)
                    {
                        Response.Redirect("~/Inicio.aspx");
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
    }
}