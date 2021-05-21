using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil_Coche_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void InsertarMarca_Click(object sender, EventArgs e)
        {
            if (MarcaValid1.IsValid && MarcaValid2.IsValid) 
            { 
                ENMarcaCoche en = new ENMarcaCoche();
                en.tipo = Tipo.Text;
                try
                {
                    if (en.createMarcaCoche())
                    {
                        Label_Estado.Text = "Success";
                        GridViewMarca.DataBind();
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
        }

        protected void BorrarMarca_Click(object sender, EventArgs e)
        {
            if (MarcaValid1.IsValid && MarcaValid2.IsValid)
            {
                ENMarcaCoche en = new ENMarcaCoche();
                en.tipo = Tipo.Text;
                try
                {
                    if (en.deleteMarcaCoche())
                    {
                        Label_Estado.Text = "Success";
                        GridViewMarca.DataBind();
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
        }

        protected void ModificarMarca_Click(object sender, EventArgs e)
        {

        }

        protected void InsertarTipo_Click(object sender, EventArgs e)
        {
            if(TipoValid1.IsValid && TipoValid2.IsValid)
            {
                ENTipoCoche en = new ENTipoCoche();
                en.categoria = Tipo.Text;
                try
                {
                    if (en.createTipoCoche())
                    {
                        Label_Estado2.Text = "Success";
                        GridViewTipoCoche.DataBind();
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
        }

        protected void BorrarTipo_Click(object sender, EventArgs e)
        {
            if (TipoValid1.IsValid && TipoValid2.IsValid)
            {
                ENTipoCoche en = new ENTipoCoche();
                en.categoria = Tipo.Text;
                try
                {
                    if (en.deleteTipoCoche())
                    {
                        Label_Estado2.Text = "Success";
                        GridViewTipoCoche.DataBind();
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
        }

        protected void ModificarTipo_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            Marca.Text = GridViewMarca.SelectedValue.ToString();
        }

        protected void GridViewTipoCoche_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tipo.Text = GridViewTipoCoche.SelectedValue.ToString();
        }
    }
}