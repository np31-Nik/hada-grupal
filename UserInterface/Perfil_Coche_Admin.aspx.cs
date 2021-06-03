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
            if (!IsPostBack)
            {
				if (Session["nif"] == null || !bool.Parse(Session["admin"].ToString()))
				{
					Response.Redirect("~/Inicio.aspx");
				}
			}
		}

		protected void InsertarMarca_Click(object sender, EventArgs e)
		{
			try{
				if (MarcaValid1.IsValid && MarcaValid2.IsValid)
				{
					ENMarcaCoche en = new ENMarcaCoche();
					en.companyia = Marca.Text;
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
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void BorrarMarca_Click(object sender, EventArgs e)
		{
			try
			{
				if (MarcaValid1.IsValid && MarcaValid2.IsValid)
				{
					ENMarcaCoche en = new ENMarcaCoche();
					en.companyia = Marca.Text;
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
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void ModificarMarca_Click(object sender, EventArgs e)
		{
			HidenRow.Visible = true;
			optionRow1.Visible = false;
			modRow1.Visible = true;
		}
		protected void CancelarModMarca_Click(object sender, EventArgs e)
		{
			HidenRow.Visible = false;
			modRow1.Visible = false;
			optionRow1.Visible = true;
			newMarca.Text = "";

		}
		protected void UpdateModMarca_Click(object sender, EventArgs e)
		{
			try
			{
				if (MarcaValid1.IsValid && MarcaValid2.IsValid &&
				newMarcaValid1.IsValid && newMarcaValid2.IsValid)
				{
					
					ENMarcaCoche en = new ENMarcaCoche();
					en.companyia = Marca.Text;
					en.NewTipo = newMarca.Text;
					if (en.updateMarcaCoche())
					{
						Label_Estado.Text = "Success";
						GridViewMarca.DataBind();
						HidenRow.Visible = false;
						modRow1.Visible = false;
						optionRow1.Visible = true;
						newMarca.Text = "";
					}
					else
					{
						Label_Estado.Text = "Error ";
					}
					
				}
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}
		protected void InsertarTipo_Click(object sender, EventArgs e)
		{
            try
            {
				if(TipoValid1.IsValid && TipoValid2.IsValid)
				{
					ENTipoCoche en = new ENTipoCoche();
					en.categoria = Tipo.Text;
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
            }
			catch (Exception)
			{
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void BorrarTipo_Click(object sender, EventArgs e)
		{
			try
			{
				if (TipoValid1.IsValid && TipoValid2.IsValid)
				{
					ENTipoCoche en = new ENTipoCoche();
					en.categoria = Tipo.Text;
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
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void ModificarTipo_Click(object sender, EventArgs e)
		{
			HidenRow2.Visible = true;
			optionRow2.Visible = false;
			modRow2.Visible = true;
		}
		protected void CancelarModTipo_Click(object sender, EventArgs e)
		{
			HidenRow2.Visible = false;
			modRow2.Visible = false;
			optionRow2.Visible = true;
			TextBoxNewTipo.Text = "";

		}
		protected void UpdateModTipo_Click(object sender, EventArgs e)
		{
			try
			{
				if (TipoValid1.IsValid && TipoValid2.IsValid &&
					newTipoValid1.IsValid && newTipoValid2.IsValid)
				{
					ENTipoCoche en = new ENTipoCoche();
					en.categoria = Tipo.Text;
					if (en.updateTipoCoche(TextBoxNewTipo.Text))
					{
						Label_Estado.Text = "Success";
						GridViewTipoCoche.DataBind();
						HidenRow2.Visible = false;
						modRow2.Visible = false;
						optionRow2.Visible = true;
						TextBoxNewTipo.Text = "";
					}
					else
					{
						Label_Estado2.Text = "Error ";
					}
				}
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
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