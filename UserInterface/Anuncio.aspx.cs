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
                    en.id = uint.Parse(Request.QueryString["anuncio_id"]);
                    en.readAnuncio();


                    TITULO.Text = en.titulo;
                    PRECIO.Text = en.precio.ToString();
                    ENUsuario propietario = en.usuario;
                    propietario.readUsuario();
                    PROPIETARIO.Text = propietario.Nombre + " " + propietario.Apellido;
                    TELEFONO.Text = propietario.Telefono;
                    EMAIL.Text = propietario.Email;
                    LOCALIDAD.Text = en.localidad;
                    COD_POSTAL.Text = en.cp.ToString();

                    switch (en.tipo)
                    {
                        case "vehiculo":
                            ENCoche coche = new ENCoche();
                            coche.id = en.id;
                            coche.readCoche();
                            ANYO.Text = coche.anyo.ToString();
                            MARCA.Text = coche.marca.tipo;
                            TIPO_COCHE.Text = coche.tipo.categoria;
                            break;
                        case "propiedad":
                            ENPropiedad prop = new ENPropiedad();
                            prop.id = en.id;
                            prop.readPropiedad();
                            REF_CAT.Text = prop.numCatastral;
                            SUPERFICIE.Text = prop.superficie.ToString();
                            DORMITORIOS.Text = prop.habitaciones.ToString();
                            BANYOS.Text = prop.banyos.ToString();
                            TIPO_PROPIEDAD.Text = prop.tipo;
                            break;
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