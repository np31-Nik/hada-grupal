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
			if (!IsPostBack)
			{

			}
		}

		protected void GridViewTipoAnuncio_SelectedIndexChanged(object sender, EventArgs e)
		{
			Tipo.Text = GridViewTipoAnuncio.SelectedValue.ToString();
		}

		protected void InsertarTipoA_Click(object sender, EventArgs e)
		{
			if(TipoValid1.IsValid && TipoValid2.IsValid)
			{
				try
				{
					ENTipoAnuncio en = new ENTipoAnuncio();
					en.Tipo = Tipo.Text;
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
				catch (Exception)
				{
					Label_Estado.Text = "Error en ejecucion INESPERADO";
				}
			}
		}

		protected void BorrarTipoA_Click(object sender, EventArgs e)
		{
			if (TipoValid1.IsValid && TipoValid2.IsValid)
			{
				try
				{
					ENTipoAnuncio en = new ENTipoAnuncio();
					en.Tipo = Tipo.Text;
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
				catch (Exception)
				{
					Label_Estado.Text = "Error en ejecucion INESPERADO";
				}
			}
		}

		protected void ModificarTipoA_Click(object sender, EventArgs e)
		{
			HidenRow.Visible = true;
			optionRow1.Visible = false;
			modRow1.Visible = true;
		}
		protected void CancelarModTipo_Click(object sender, EventArgs e)
		{
			HidenRow.Visible = false;
			modRow1.Visible = false;
			optionRow1.Visible = true;
			TextBoxNewTipo.Text = "";

		}
		protected void UpdateModTipo_Click(object sender, EventArgs e)
		{
            try
            {
				if (TipoValid1.IsValid && TipoValid2.IsValid &&
				newTipoValid1.IsValid && newTipoValid2.IsValid)
				{
					ENTipoAnuncio en = new ENTipoAnuncio();
					en.Tipo = Tipo.Text;
					en.NewTipo = TextBoxNewTipo.Text;
					if (en.updateTipoAnuncio())
					{
						Label_Estado.Text = "Success";
						GridViewTipoAnuncio.DataBind();
						HidenRow.Visible = false;
						modRow1.Visible = false;
						optionRow1.Visible = true;
						TextBoxNewTipo.Text = "";
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
		protected void InsertarLocalidad_Click(object sender, EventArgs e)
		{
			if(LocalidadValid1.IsValid && LocalidadValid2.IsValid)
			{
				 try
				 {
					ENLocalidad en = new ENLocalidad();
					en.localidad = Localidad.Text;
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
				 catch (Exception)
				 {
					Label_Estado2.Text = "Error en ejecucion INESPERADO";

				}
			}
		}

		protected void BorrarLocalidad_Click(object sender, EventArgs e)
		{
			if (LocalidadValid1.IsValid && LocalidadValid2.IsValid)
			{
				try
				{
					ENLocalidad en = new ENLocalidad();
					en.localidad = Localidad.Text;
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
				catch (Exception)
				{
					Label_Estado2.Text = "Error en ejecucion INESPERADO";
				}
			}
		}

		protected void ModificarLocalidad_Click(object sender, EventArgs e)
		{
			HidenRow2.Visible = true;
			modRow2.Visible = true;
			optionRow2.Visible = false;
		}
		protected void CancelarModLocalidad_Click(object sender, EventArgs e)
		{
			HidenRow2.Visible = false;
			modRow2.Visible = false;
			optionRow2.Visible = true;
			newLocalidad.Text = "";

		}
		protected void UpdateModLocalidad_Click(object sender, EventArgs e)
		{
            try
            {
				if (LocalidadValid1.IsValid && LocalidadValid2.IsValid &&
				newLocalidadValid1.IsValid && newLocalidadValid2.IsValid)
				{
					ENLocalidad en = new ENLocalidad();
					en.localidad = Localidad.Text;
					en.newLocalidad = newLocalidad.Text;
					if (en.updateLocalidad())
					{
						Label_Estado2.Text = "Success";
						GridViewLocalidad.DataBind();
						HidenRow2.Visible = false;
						modRow2.Visible = false;
						optionRow2.Visible = true;
						newLocalidad.Text = "";
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
		protected void GridViewLocalidad_SelectedIndexChanged(object sender, EventArgs e)
		{
			Localidad.Text = GridViewLocalidad.SelectedValue.ToString();
		}
	}
}