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
			if (!IsPostBack)
			{
				if (Session["nif"] == null)
				{
					Response.Redirect("~/Inicio.aspx");
				}
			}
		}
		private bool desdeHastaCheck()
        {
			return (int.Parse(TextBoxDesde.Text) < int.Parse(TextBoxHasta.Text));
        }
		protected void InsertarHipoteca_Click(object sender, EventArgs e)
		{
			
			try
			{
                if (BancoHValid1.IsValid && BancoHValid2.IsValid &&
					HastaValid1.IsValid && HastaValid2.IsValid &&
					InteresValid1.IsValid && InteresValid2.IsValid &
					DesdeValid1.IsValid && DesdeValid2.IsValid)
                {
					if (desdeHastaCheck())
					{
						ENHipoteca en = new ENHipoteca();
						en.BANCO = TextBoxBancoH.Text;
						en.FECHADESDE = int.Parse(TextBoxDesde.Text);
						en.FECHAHASTA = int.Parse(TextBoxHasta.Text);
						en.INTERESES = int.Parse(TextBoxInteres.Text);

						en.NUMSOLICITUDES = 0;
						if (en.createHipoteca())
						{
							Label_Estado.Text = "Success";
							GridViewHipoteca.DataBind();
						}
						else
						{
							Label_Estado2.Text = "Error ";
						}
					}
                    else
                    {
						Label_Estado2.Text = "Desde tiene que ser menor que Hasta ";
					}
				}
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void BorrarHipoteca_Click(object sender, EventArgs e)
		{
			try
			{
                if (TextBoxId.Text != "")
                {
					ENHipoteca en = new ENHipoteca();
					en.ID = int.Parse(TextBoxId.Text);
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
				else
				{
					Label_Estado2.Text = "Selecciona la Hipoteca";
				}
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void ModificarHipoteca_Click(object sender, EventArgs e)
		{
			modRow2.Visible = true;
			optionRow2.Visible = false;
		}
		protected void CancelarModHipoteca_Click(object sender, EventArgs e)
		{
			modRow2.Visible = false;
			optionRow2.Visible = true;
			TextBoxId.Text = "";
			TextBoxBancoH.Text = "";
			TextBoxDesde.Text = "";
			TextBoxHasta.Text = "";
			TextBoxInteres.Text = "";
		}
		protected void UpdateModHipoteca_Click(object sender, EventArgs e)
		{
            try
            {
				if (BancoHValid1.IsValid && BancoHValid2.IsValid &&
					HastaValid1.IsValid && HastaValid2.IsValid &&
					InteresValid1.IsValid && InteresValid2.IsValid &
					DesdeValid1.IsValid && DesdeValid2.IsValid)
				{
					if (desdeHastaCheck())
					{
						ENHipoteca en = new ENHipoteca();
						en.ID = int.Parse(TextBoxId.Text);
						en.BANCO = TextBoxBancoH.Text;
						en.FECHADESDE = int.Parse(TextBoxDesde.Text);
						en.FECHAHASTA = int.Parse(TextBoxHasta.Text);
						en.INTERESES = int.Parse(TextBoxInteres.Text);
						if (en.updateHipoteca())
						{
							modRow2.Visible = false;
							optionRow2.Visible = true;
							Label_Estado2.Text = "Success";
							GridViewHipoteca.DataBind();
						}
						else
						{
							Label_Estado2.Text = "Error ";
						}
					}
					else
					{
						Label_Estado2.Text = "Desde tiene que ser menor que Hasta ";
					}
				}
            }
            catch (Exception)
            {
				Label_Estado2.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void InsertarBanco_Click(object sender, EventArgs e)
		{
			try
			{
				if (BancoValid.IsValid && BancoValid1.IsValid &&
					EmailValid1.IsValid && EmailValid2.IsValid &&
					TelefonoValid1.IsValid && TelefonoValid2.IsValid)
				{
					ENBanco en = new ENBanco();
					en.BANCO = TextBoxBanco.Text;
					en.EMAIL = TextBoxEmail.Text;
					en.TELEFONO = TextBoxTelefono.Text;
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
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void BorrarBanco_Click(object sender, EventArgs e)
		{
			try
			{
				if (BancoValid.IsValid && BancoValid1.IsValid)
				{
					ENBanco en = new ENBanco();
					en.BANCO = TextBoxBanco.Text;
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
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}

		protected void ModificarBanco_Click(object sender, EventArgs e)
		{
			try
			{
				if(BancoValid.IsValid && BancoValid1.IsValid)
                {
					ENBanco en = new ENBanco();
					en.BANCO = TextBoxBanco.Text;
					if (!en.readBanco())
					{
						Label_Estado.Text = "Nombre del banco no existe";
					}
					else
					{
						optionRow1.Visible = false;
						TextBoxBanco.Enabled = false;
						modRow1.Visible = true;
					}
				}
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}
		protected void UpdateModBanco_Click(object sender, EventArgs e)
		{
			try
			{
				if (BancoValid.IsValid && BancoValid1.IsValid &&
					EmailValid1.IsValid && EmailValid2.IsValid &&
					TelefonoValid1.IsValid && TelefonoValid2.IsValid)
				{
					ENBanco en = new ENBanco();
					en.BANCO = TextBoxBanco.Text;
					en.EMAIL = TextBoxEmail.Text;
					en.TELEFONO = TextBoxTelefono.Text;
					if (en.updateBanco())
					{
						Label_Estado.Text = "Success";
						GridViewBanco.DataBind();
						optionRow1.Visible = true;
						TextBoxBanco.Enabled = true;
						modRow1.Visible = false;
					}
					else
					{
						Label_Estado.Text = "Error";
					}
				}
			}
			catch (Exception)
			{
				Label_Estado.Text = "Error en ejecucion INESPERADO";
			}
		}
		protected void CancelarModBanco_Click(object sender, EventArgs e)
		{
			TextBoxBanco.Text = "";
			TextBoxEmail.Text = "";
			TextBoxTelefono.Text = "";
			optionRow1.Visible = true;
			TextBoxBanco.Enabled = true;
			modRow1.Visible = false;
		}
		protected void GridViewBanco_SelectedIndexChanged(object sender, EventArgs e)
		{
			TextBoxBanco.Text = GridViewBanco.SelectedRow.Cells[1].Text;
			TextBoxTelefono.Text = GridViewBanco.SelectedRow.Cells[2].Text;
			TextBoxEmail.Text = GridViewBanco.SelectedRow.Cells[3].Text;
		}

		protected void GridViewHipoteca_SelectedIndexChanged(object sender, EventArgs e)
		{
			TextBoxId.Text = GridViewHipoteca.SelectedRow.Cells[1].Text;
			TextBoxBancoH.Text = GridViewHipoteca.SelectedRow.Cells[2].Text;
			TextBoxDesde.Text = GridViewHipoteca.SelectedRow.Cells[3].Text;
			TextBoxHasta.Text = GridViewHipoteca.SelectedRow.Cells[4].Text;
			TextBoxInteres.Text = GridViewHipoteca.SelectedRow.Cells[5].Text;
		}
	}
}