using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil_Hipoteca_Banco_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertarHipoteca_Click(object sender, EventArgs e)
        {
            ENHipoteca en = new ENHipoteca();
            en.BANCO = TextBoxBancoH.Text;
            //en.FECHADESDE = int.Parse(TextBoxDesde.Text);
            //en.FECHAHASTA= int.Parse(TextBoxHasta.Text);
            en.INTERESES = int.Parse(TextBoxInteres.Text);

            try
            {
                if (en.createHipoteca())
                {
                    Label_Estado.Text = "Success";
                    GridViewHipoteca.DataBind();
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

        protected void BorrarHipoteca_Click(object sender, EventArgs e)
        {
            ENHipoteca en = new ENHipoteca();
            en.ID = int.Parse(TextBoxId.Text);

            try
            {
                if (en.deleteHipoteca())
                {
                    Label_Estado2.Text = "Success";
                    GridViewHipoteca.DataBind();
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
            }
        }

        protected void ModificarHipoteca_Click(object sender, EventArgs e)
        {

        }

        protected void InsertarBanco_Click(object sender, EventArgs e)
        {
            ENBanco en = new ENBanco();
            en.BANCO = TextBoxBanco.Text;
            en.EMAIL = TextBoxEmail.Text;
            //en.TELEFONO = TextBoxTelefono.Text;

            try
            {
                if (en.createBanco())
                {
                    Label_Estado.Text = "Success";
                    GridViewBanco.DataBind();
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

        protected void BorrarBanco_Click(object sender, EventArgs e)
        {
            ENBanco en = new ENBanco();
            en.BANCO = TextBoxBanco.Text;

            try
            {
                if (en.deleteBanco())
                {
                    Label_Estado.Text = "Success";
                    GridViewBanco.DataBind();
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

        protected void ModificarBanco_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewBanco_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxBanco.Text = GridViewBanco.SelectedRow.Cells[0].Text;
            TextBoxHasta.Text = GridViewBanco.SelectedRow.Cells[1].Text;
            TextBoxTelefono.Text = GridViewBanco.SelectedRow.Cells[2].Text;

        }

        protected void GridViewHipoteca_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}