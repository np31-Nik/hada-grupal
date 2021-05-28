using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
	/*
	 * <asp:Table ID="Table1" runat="server" CellPadding="6">
									<asp:TableRow>

									</asp:TableRow>
									<asp:TableRow>

									</asp:TableRow>
									<asp:TableRow>

									</asp:TableRow>
								</asp:Table>
	*/
	public partial class Perfil_Propiedad_Admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void InsertarTipo_Click(object sender, EventArgs e)
		{
			if(TipoValidE.IsValid && TipoValidR.IsValid)
			{
				ENTipoPropiedad en = new ENTipoPropiedad();
				en.tipo = Tipo.Text;
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
		}

		protected void BorrarTipo_Click(object sender, EventArgs e)
		{
			if (TipoValidE.IsValid && TipoValidR.IsValid)
			{
				ENTipoPropiedad en = new ENTipoPropiedad();
				en.tipo = Tipo.Text;
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
		}

		protected void ModificarTipo_Click(object sender, EventArgs e)
		{
			optionRow.Visible = false;
			newTipo.Visible = true;
			modTipoRow.Visible = true;
		}
		protected void CancelarModTipo_Click(object sender, EventArgs e)
		{
			modTipoRow.Visible = false;
			newTipo.Visible = false;
			optionRow.Visible = true;
			TextBoxNewTipo.Text = "";
		}
		protected void UpdateModTipo_Click(object sender, EventArgs e)
		{
			if (TipoValidE.IsValid && TipoValidR.IsValid &&
				newTipoValid1.IsValid && newTipoValid2.IsValid)
			{
				ENTipoPropiedad en = new ENTipoPropiedad();
				en.tipo = Tipo.Text;
				if (en.updateTipoPropiedad(TextBoxNewTipo.Text))
				{
					Label_Estado.Text = "Success";
					GridViewTipoPropiedad.DataBind();
					modTipoRow.Visible = false;
					newTipo.Visible = false;
					optionRow.Visible = true;
					TextBoxNewTipo.Text = "";
				}
				else
				{
					Label_Estado.Text = "Error ";
				}
			}
		}

		protected void GridViewTipoPropiedad_SelectedIndexChanged(object sender, EventArgs e)
		{
			Tipo.Text = GridViewTipoPropiedad.SelectedValue.ToString();
		}
	}
}