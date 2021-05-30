using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
	public partial class Perfil_MisAnuncios : System.Web.UI.Page
	{
		ENAnuncio aEng = new ENAnuncio();
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
		
		private void offCoche()
        {
			TipoCoche.Visible = true;
			TipoCocheList.Visible = false;
			MarcaCoche.Visible = true;
			MarcaCocheList.Visible = false;
			AnyoCoche.Enabled = false;
			AnyoCoche.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
		}
		private void offPropiedad()
		{
			Superficie.Enabled = false;
			Superficie.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			Nbanyo.Enabled = false;
			Nbanyo.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			Ndorm.Enabled = false;
			Ndorm.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			Catastral.Enabled = false;
			Catastral.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			TipoPropiedadList.Visible = false;
			TipoPropiedad.Visible = true;
		}
		private void offAnuncio()
		{
			modRow1.Visible = false;
			optionRow1.Visible = true;
			Titulo.Enabled = false;
			Titulo.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			Descripcion.Enabled = false;
			Descripcion.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
			Localidad.Visible = true;
			LocalidadList.Visible = false;
			TipoAnuncio.Visible = true;
			TipoAnuncioList.Visible = false;
			PrecioAnuncio.Enabled = false;
			PrecioAnuncio.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "None");
		}
		protected void ModFoto_Click(object sender, EventArgs e)
		{
			NoModFoto.Visible = true;
			YesModFoto.Visible = true;
			BorrarFoto.Visible = false;
			UploadFoto.Visible = false;
		}
		protected void NoModFoto_Click(object sender, EventArgs e)
		{
			NoModFoto.Visible = false;
			YesModFoto.Visible = false;
			BorrarFoto.Visible = true;
			UploadFoto.Visible = true;
		}
		protected void YesModFoto_Click(object sender, EventArgs e)
		{
			try
			{
				if (ImageValid.IsValid)
				{
					if (ImageUpload.HasFile)
					{
						ListViewItem item = ListView1.Items[ListView1.SelectedIndex];
						HiddenField idList = (HiddenField)item.FindControl("imgID");
						int fotoId = int.Parse(idList.Value.ToString());
						ENFoto en = new ENFoto(ImageUpload.PostedFile, aEng);
						en.ID = fotoId;
						if (en.updateFoto())
						{
							NoModFoto.Visible = false;
							YesModFoto.Visible = false;
							BorrarFoto.Visible = true;
							UploadFoto.Visible = true;
							ListView1.DataBind();
							Label_Estado2.Text = "Success";
						}
						else
						{
							Label_Estado2.Text = "Error";
						}
					}
					else
					{
						Label_Estado2.Text = "No hay imagenes a subir";
					}
				}
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error INESPERADO: T_T";
			}
		}
		protected void UploadFoto_Click(object sender, EventArgs e)
		{
			NoUploadFoto.Visible = true;
			YesUploadFoto.Visible = true;
			BorrarFoto.Visible = false;
			ModFoto.Visible = false;
		}
		protected void NoUploadFoto_Click(object sender, EventArgs e)
		{
			NoUploadFoto.Visible = false;
			YesUploadFoto.Visible = false;
			BorrarFoto.Visible = true;
			ModFoto.Visible = true;
		}
		protected void YesUploadFoto_Click(object sender, EventArgs e)
		{
			try
			{
                if (ImageValid.IsValid)
                {
                    if (ImageUpload.HasFile) {
						ENFoto en = new ENFoto(ImageUpload.PostedFile, aEng);
						if (en.createFoto())
						{
							NoUploadFoto.Visible = false;
							YesUploadFoto.Visible = false;
							BorrarFoto.Visible = true;
							ModFoto.Visible = true;
							ListView1.DataBind();
							Label_Estado2.Text = "Success";
						}
						else
						{
							Label_Estado2.Text = "Error";
						}
					}
                    else
                    {
						Label_Estado2.Text = "No hay imagenes a subir";
					}
                }
			}
			catch (Exception)
			{
				Label_Estado2.Text = "Error INESPERADO: T_T";
			}
		}
		protected void BorrarFoto_Click(object sender, EventArgs e)
		{
			NoBorrarFoto.Visible = true;
			YesBorrarFoto.Visible = true;
			ModFoto.Visible = false;
			UploadFoto.Visible = false;
		}
		protected void NoBorrarFoto_Click(object sender, EventArgs e)
		{
			NoBorrarFoto.Visible = false;
			YesBorrarFoto.Visible = false;
			ModFoto.Visible = true;
			UploadFoto.Visible = true;
		}
		protected void YesBorrarFoto_Click(object sender, EventArgs e)
		{
            try
            {
				ListViewItem item = ListView1.Items[ListView1.SelectedIndex];
				HiddenField idList = (HiddenField)item.FindControl("imgID");
				int fotoId = int.Parse(idList.Value.ToString());
				ENFoto en = new ENFoto();
				en.ID = fotoId;
                if (en.deleteFoto())
                {
					NoBorrarFoto.Visible = false;
					YesBorrarFoto.Visible = false;
					ModFoto.Visible = true;
					UploadFoto.Visible = true;
					ListView1.DataBind();
					Label_Estado2.Text = "Success";
				}
                else
                {
					Label_Estado2.Text = "Error";
				}
			}
            catch (Exception)
            {
				Label_Estado2.Text = "Error INESPERADO: T_T";
			}
		}
		protected void BorrarAnuncio_Click(object sender, EventArgs e)
		{
			modRow2.Visible = true;
			optionRow1.Visible = false;
		}
		protected void Cancelar2ModAnuncio_Click(object sender, EventArgs e)
		{
			modRow2.Visible = false;
			optionRow1.Visible = true;
		}
		protected void DeleteModAnuncio_Click(object sender, EventArgs e)
		{
            try
            {
				if(aEng.deleteAnuncio())
                {
					modRow2.Visible = false;
					optionRow1.Visible = true;
					UpdatePanelAnuncio.Visible = false;
					IdAnuncio.Text = "";
					Label_Estado.Text = "Success";
					FotoUpdatePanel.Visible = false;
					UpdatePanelAnuncio.Visible = false;
					ImageModButtons2.Visible = false;
				}
				else
                {
					Label_Estado.Text = "Error";
				}
            }
            catch (Exception)
            {
				Label_Estado.Text = "Error INESPERADO: T_T";
			}
		}
		protected void UpdateModAnuncio_Click(object sender, EventArgs e)
		{
            try
            {
				if (TituloValid.IsValid && DescripcionValid.IsValid &&
					LocalidadValid.IsValid && TipoAnuncioValid.IsValid &&
					PrecioValid1.IsValid && PrecioValid2.IsValid &&
					CategoriaValid.IsValid)
				{
					ENAnuncio enA = new ENAnuncio();
					enA.id = int.Parse(IdAnuncio.Text);
					enA.titulo = Titulo.Text;
					enA.categoria = CategoriaAnuncio.Text;
					enA.descripcion = Descripcion.Text;
					enA.localidad.localidad = Localidad.Text;

					switch (CategoriaAnuncio.Text)
					{
						case "Coche":
							if (AnyoCocheValid1.IsValid && AnyoCocheValid2.IsValid &&
								MarcaCocheValid.IsValid && TipoCocheValid.IsValid)
							{
								ENCoche enC = new ENCoche();
								enC.anyo = int.Parse(AnyoCoche.Text);
								//enC.marca = MarcaCoche.Text;
								enC.tipo.categoria = TipoCoche.Text;
								enA.coche = enC;
                                if (enA.updateAnuncio())
                                {
									AnuncioGridView.DataBind();
									offCoche();
									Label_Estado.Text = "Success";

								}
								else
                                {
									Label_Estado.Text = "Error";
								}
							}
							else
							{
								Label_Estado.Text = "Falta algo";
							}

							break;
						case "Propiedad":
                            if (SuperficiValid1.IsValid && SuperficiValid2.IsValid &&
								NbanyoValid1.IsValid && NdormValid1.IsValid &&
								TipoPropiedadValid.IsValid)
                            {
								ENPropiedad enP = new ENPropiedad();
								enP.superficie = int.Parse(Superficie.Text);
								enP.banyos = int.Parse(Nbanyo.Text);
								enP.habitaciones = int.Parse(Ndorm.Text);
								enP.numCatastral = Catastral.Text;
								enP.tipo.tipo = TipoPropiedad.Text;
                                if (enA.updateAnuncio())
                                {
									AnuncioGridView.DataBind();
									offPropiedad();
									Label_Estado.Text = "Success";

								}
								else
                                {
									Label_Estado.Text = "Error";
								}
                            }
							else
							{
								Label_Estado.Text = "Falta algo";
							}
							break;
						default:
							Label_Estado.Text = "Error INESPERADO: categoria desconocida";
							break;
					}
				}
			}
            catch (Exception)
            {
				Label_Estado.Text = "Error INESPERADO: error en ejecucion";
			}
		}
		protected void ModificarAnuncio_Click(object sender, EventArgs e)
		{
			Titulo.Enabled = true;
			Titulo.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
			Descripcion.Enabled = true;
			Descripcion.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
			Localidad.Visible = false;
			LocalidadList.Visible = true;
			TipoAnuncio.Visible = false;
			TipoAnuncioList.Visible = true;
			PrecioAnuncio.Enabled = true;
			PrecioAnuncio.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
			switch (CategoriaAnuncio.Text)
			{
				case "Coche":
					TipoCoche.Visible = false;
					TipoCocheList.Visible = true;
					MarcaCoche.Visible = false;
					MarcaCocheList.Visible = true;
					AnyoCoche.Enabled = true;
					AnyoCoche.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
					break;
				case "Propiedad":
					Superficie.Enabled = true;
					Superficie.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
					Nbanyo.Enabled = true;
					Nbanyo.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
					Ndorm.Enabled = true;
					Ndorm.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
					Catastral.Enabled = true;
					Catastral.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Inset");
					TipoPropiedadList.Visible = true;
					TipoPropiedad.Visible = false;
					break;
				default:
					Label_Estado.Text = "Error INESPERADO: categoria desconocida";
					break;
			}
			modRow1.Visible = true;
			optionRow1.Visible = false;
		}
		protected void CancelarModAnuncio_Click(object sender, EventArgs e)
		{
			try
			{
				offAnuncio();
				switch (CategoriaAnuncio.Text)
				{
					case "Coche":
						MarcaCoche.Text = "?"; //enA.coche.marca.?
						TipoCoche.Text = aEng.coche.tipo.categoria;
						AnyoCoche.Text = aEng.coche.anyo.ToString();
						offCoche();
						break;
					case "Propiedad":
						Superficie.Text = aEng.prop.superficie.ToString();
						Ndorm.Text = aEng.prop.habitaciones.ToString();
						Nbanyo.Text = aEng.prop.banyos.ToString();
						Catastral.Text = aEng.prop.numCatastral;
						TipoPropiedad.Text = aEng.prop.tipo.tipo;
						offPropiedad();
						break;
					default:
						Label_Estado.Text = "Error INESPERADO: categoria desconocida";
						break;
				}
			}
            catch (Exception)
            {
				Label_Estado.Text = "Error INESPERADO: T_T";
			}
		}
		protected void TipoPropiedadList_SelectedIndexChanged(object sender, EventArgs e)
		{
			TipoPropiedad.Text = TipoPropiedadList.SelectedValue;
		}
		protected void LocalidadList_SelectedIndexChanged(object sender, EventArgs e)
		{
			Localidad.Text = LocalidadList.SelectedValue;
		}
		protected void TipoAnuncioList_SelectedIndexChanged(object sender, EventArgs e)
		{
			TipoAnuncio.Text = TipoAnuncioList.SelectedValue;
		}
		protected void MarcaCocheList_SelectedIndexChanged(object sender, EventArgs e)
		{
			MarcaCoche.Text = MarcaCocheList.SelectedValue;
		}
		protected void TipoCocheList_SelectedIndexChanged(object sender, EventArgs e)
		{
			TipoCoche.Text = TipoCocheList.SelectedValue;
		}

        protected void AnuncioGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
				IdAnuncio.Text = AnuncioGridView.SelectedRow.Cells[0].Text;
				Titulo.Text = AnuncioGridView.SelectedRow.Cells[1].Text;
				TipoAnuncio.Text = AnuncioGridView.SelectedRow.Cells[2].Text;
				CategoriaAnuncio.Text = AnuncioGridView.SelectedRow.Cells[3].Text;
				ENAnuncio enA = new ENAnuncio();
				enA.id = int.Parse(IdAnuncio.Text);
				if (enA.readAnuncio())
				{
					Descripcion.Text = enA.descripcion;
					aEng = enA;
					aEng.id = enA.id;
					
					switch (CategoriaAnuncio.Text)
					{
						case "Coche":
							MarcaCoche.Text = "?"; //enA.coche.marca.?
							TipoCoche.Text = enA.coche.tipo.categoria;
							AnyoCoche.Text = enA.coche.anyo.ToString();
							CocheTable.Visible = true;
							UpdatePanelAnuncio.Visible = true;
							break;
						case "Propiedad":
							Superficie.Text = enA.prop.superficie.ToString();
							Ndorm.Text = enA.prop.habitaciones.ToString();
							Nbanyo.Text = enA.prop.banyos.ToString();
							Catastral.Text = enA.prop.numCatastral;
							TipoPropiedad.Text = enA.prop.tipo.tipo;
							PropiedadTable.Visible = true;
							UpdatePanelAnuncio.Visible = true;

							break;
						default:
							Label_Estado.Text = "Error INESPERADO: categoria desconocida";
							break;
					}
					FotoUpdatePanel.Visible = true;
					UpdatePanelAnuncio.Visible = true;
					ImageModButtons2.Visible = true;
				}
                else
                {
					Label_Estado.Text = "Error INESPERADO: readAnuncio()";
				}
			}
            catch (Exception)
            {
				Label_Estado.Text = "Error INESPERADO";
			}
		}
    }
}