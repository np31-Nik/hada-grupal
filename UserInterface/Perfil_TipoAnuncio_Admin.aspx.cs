using library;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil_TipoAnuncio_Admin : System.Web.UI.Page
    {
        /*ENTipoAnuncio enl = new ENTipoAnuncio();
        //ENLocalidad enl2 = new ENLocalidad();
        DataSet d_TipoAnuncio = new DataSet();
        DataSet d_Localidad = new DataSet();*/
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewTipoAnuncio.HeaderRow.Cells[0].Attributes.Add("style", "min-width: 100px");
            /* if (!Page.IsPostBack)
             {
                 d_TipoAnuncio = enl.listarTipoAnuncio();
                 GridViewTipoAnuncio.DataSource = d_TipoAnuncio;
                 GridViewTipoAnuncio.DataBind();
             }*/
        }

        protected void GridViewTipoAnuncio_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tipo.Text = GridViewTipoAnuncio.SelectedValue.ToString();
        }

        protected void InsertarTipoA_Click(object sender, EventArgs e)
        {
            ENTipoAnuncio en = new ENTipoAnuncio();
            en.Tipo = Tipo.Text;
            en.createTipoAnuncio();
            GridViewTipoAnuncio.DataBind();
        }

        protected void BorrarTipoA_Click(object sender, EventArgs e)
        {
           
        }
    }
}