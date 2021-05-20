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

        }

        protected void GridViewTipoAnuncio_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tipo.Text = GridViewTipoAnuncio.SelectedValue.ToString();
        }

        protected void InsertarTipoA_Click(object sender, EventArgs e)
        {
            ENTipoAnuncio en = new ENTipoAnuncio();
            en.Tipo = Tipo.Text;
            try
            {
                if (en.createTipoAnuncio())
                {
                    Label_Estado.Text = "Success";
                    GridViewTipoAnuncio.DataBind();
                }
                else
                {
                    Label_Estado.Text = "Error ";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("User operation has failed.Error: {0}", ex.Message);
                Label_Estado.Text = ex.Message;
            }
        }

        protected void BorrarTipoA_Click(object sender, EventArgs e)
        {
            ENTipoAnuncio en = new ENTipoAnuncio();
            en.Tipo = Tipo.Text;
            try
            {
                if (en.deleteTipoAnuncio())
                {
                    Label_Estado.Text = "Success";
                    GridViewTipoAnuncio.DataBind();
                }
                else
                {
                    Label_Estado.Text = "Error ";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("User operation has failed.Error: {0}", ex.Message);
                Label_Estado.Text = ex.Message;
            }
        }

        protected void ModificarTipoA_Click(object sender, EventArgs e)
        {

        }

        protected void InsertarLocalidad_Click(object sender, EventArgs e)
        {
            /* ENLocalidad en = new ENLocalidad();
             en.Localidad = Tipo.Text;
             try
             {
                 if (en.createLocalidad())
                 {
                     Label_Estado2.Text = "Success";
                     GridViewLocalidad.DataBind();
                 }
                 else
                 {
                     Label_Estado2.Text = "Error ";
                 }
             }
             catch (Exception ex)
             {
                 Console.WriteLine("User operation has failed.Error: {0}", ex.Message);
                 Label_Estado2.Text = ex.Message;
             }*/
        }

        protected void BorrarLocalidad_Click(object sender, EventArgs e)
        {
            /* ENLocalidad en = new ENLocalidad();
            en.Localidad = Tipo.Text;
            try
            {
                if (en.deleteLocalidad())
                {
                    Label_Estado2.Text = "Success";
                    GridViewLocalidad.DataBind();
                }
                else
                {
                    Label_Estado2.Text = "Error ";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("User operation has failed.Error: {0}", ex.Message);
                Label_Estado2.Text = ex.Message;
            }*/
        }

        protected void ModificarLocalidad_Click(object sender, EventArgs e)
        {

        }
    }
}