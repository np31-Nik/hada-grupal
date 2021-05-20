using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil_Propiedad_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertarTipo_Click(object sender, EventArgs e)
        {
            ENTipoPropiedad en = new ENTipoPropiedad();
            en.tipo = Tipo.Text;
            try
            {
                if (en.createTipoPropiedad())
                {
                    Label_Estado.Text = "Success";
                    GridViewTipoPropiedad.DataBind();
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

        protected void BorrarTipo_Click(object sender, EventArgs e)
        {
            ENTipoPropiedad en = new ENTipoPropiedad();
            en.tipo = Tipo.Text;
            try
            {
                if (en.deleteTipoPropiedad())
                {
                    Label_Estado.Text = "Success";
                    GridViewTipoPropiedad.DataBind();
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

        protected void ModificarTipo_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewTipoPropiedad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}