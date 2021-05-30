using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using library;

namespace UserInterface
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        List<ENLocalidad> list = new List<ENLocalidad>();//lista donde almacenaras todo el item de la tabla de la bbdd

        protected void Page_Load(object sender, EventArgs e)
        {
            mensaje.Text = "";
            vehiculo.Visible = true;
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            if (Session["nif"] == null)
            {
                Response.Redirect("~/Registros.aspx");
            }
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //mensaje.Text = "elegiste: " + RadioButtonList1.SelectedItem.Text;
            if (RadioButtonList1.SelectedItem.Text == "Vehiculo")
            {
                vehiculo.Visible = true;
                propiedad.Visible = false;
            }
            else if (RadioButtonList1.SelectedItem.Text == "Propiedad")
            {
                precioProp.Text = "Precio: ";
                vehiculo.Visible = false;
                propiedad.Visible = true;
            }
        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tipoAnuncio.SelectedItem.Text == "Alquiler")
            {
                precioProp.Text = "Precio por mes:";
            }
            else if (tipoAnuncio.SelectedItem.Text == "Venta")
            {
                precioProp.Text = "Precio de venta:";
            }
        }

        protected void PublicarClick(object sender, EventArgs e)
        {
            int aux;
            bool formatoCorrercto = false;
            Page.Validate("main");
            if (RadioButtonList1.SelectedItem.Text == "Vehiculo")
                Page.Validate("vehiculo");
            else if(RadioButtonList1.SelectedItem.Text == "Propiedad")
            {
                vehiculo.Visible = false;
                Page.Validate("propiedad");
            }
            if (Page.IsValid)
            {
                if (titulo.Text.Length > 55)
                {
                    mensaje.Text = "El tamaño maximo de titulo es de 55 caracteres. Tamaño actual: " + titulo.Text.Length;

                }
                else if (descripcion.Text.Length > 1000)
                {
                    mensaje.Text = "El tamaño maximo de la descripcion es de 1000 caracteres. Tamaño actual: " + descripcion.ToString().Length;

                }
                
                else
                {

                    if ((cargarimg1.HasFile || cargarimg1.HasFiles) && cargarimg1.PostedFiles.Count < 10)
                    {
                        formatoCorrercto = true;
                        foreach (HttpPostedFile file in cargarimg1.PostedFiles)
                        {
                            if (file.ContentType != "image/jpg" &&
                                file.ContentType != "image/jpeg" &&
                                file.ContentType != "image/png" &&
                                file.ContentType != "image/JPG" &&
                                file.ContentType != "image/JPEG" &&
                                file.ContentType != "image/PNG")

                                formatoCorrercto = false;
                        }

                    }
                    if (!formatoCorrercto)
                    {
                        mensaje.Text = "Debe cargar al menos una imagen pero no mas de 10. Formato obligatorio: .png o .jpg o .jpeg";
                    }
                    if (RadioButtonList1.SelectedItem.Text == "Vehiculo" && formatoCorrercto)
                    {
                        vehiculo.Visible = true;
                        propiedad.Visible = false;
                        if (marca.Text == "0")
                        {
                            mensaje.Text = "Debe elegir marca de coche";
                        }
                        else if (tipoCoche.Text == "0")
                        {
                            mensaje.Text = "Debe elegir el tipo de coche";
                        }
                        else if (precioVehiculo.Text == "")
                        {
                            mensaje.Text = "El campo precio es obligatorio";
                        }
                        else if (anyo.Text == "")
                        {
                            mensaje.Text = "El campo anyo es obligatorio";

                        }
                        else if (int.TryParse(anyo.Text, out aux))
                        {
                            if (aux > 2021)
                                mensaje.Text = "El campo año no puede tomar valor mas grande que 2021";

                        }
                        else
                        {
                            ENLocalidad loc = new ENLocalidad(localidad.SelectedItem.Text);
                            ENTipoAnuncio tipoAnun = new ENTipoAnuncio(tipoAnuncio.SelectedItem.Text);
                            ENMarcaCoche marcaC = new ENMarcaCoche("", marca.SelectedItem.Text, "");
                            ENTipoCoche tipoC = new ENTipoCoche(tipoCoche.SelectedItem.Text);
                            ENCoche car = new ENCoche(int.Parse(anyo.Text), tipoC, marcaC);
                            ENUsuario user = new ENUsuario();
                            ENAnuncio anuncio = new ENAnuncio(titulo.Text, loc, descripcion.Text, float.Parse(precioVehiculo.Text), tipoAnun, user, car);
                            anuncio.categoria = "coche";
                            anuncio.usuario.Nif = Session["nif"].ToString();


                            anuncio.EsCoche = true;

                            if (anuncio.createAnuncio())
                            {
                                ENFoto img = new ENFoto();
                                img.Anuncio.id = anuncio.id;
                                if (img.uploadMultiplImage(cargarimg1.PostedFiles))
                                {
                                    Response.Redirect("~/Anuncio.aspx?anuncio_id=" + anuncio.id);
                                }
                                else
                                {
                                    anuncio.deleteAnuncio();
                                }

                            }
                            else
                            {
                                mensaje.Text = "El anuncio no se ha creado. Intentalo mas tarde.";
                            }
                        }

                    }

                    else if (RadioButtonList1.SelectedItem.Text == "Propiedad" && formatoCorrercto)
                    {
                        vehiculo.Visible = false;
                        propiedad.Visible = true;

                        if (NumHabit.Text != "" && !int.TryParse(NumHabit.Text, out aux))
                        {
                            mensaje.Text = "Numero de habitaciones debe ser un numero entero";
                        }
                        else if (!int.TryParse(Superficie.Text.ToString(), out aux))
                        {
                            mensaje.Text = "Superficie debe ser un numero entero";
                        }
                        else if (NumBanyos.Text != "" && !int.TryParse(NumBanyos.Text, out aux))
                        {
                            mensaje.Text = "Numero de baños debe ser un numero entero";
                        }
                        else
                        {
                            ENTipoAnuncio tipoAnun = new ENTipoAnuncio(tipoAnuncio.SelectedItem.Text);
                            ENLocalidad loc = new ENLocalidad(localidad.SelectedItem.Text);
                            ENTipoPropiedad tipoP = new ENTipoPropiedad(TipoCasa.SelectedItem.Text);

                            //ENPropiedad propiedadAnuncio = new ENPropiedad();
                            ENUsuario user = new ENUsuario();
                            ENAnuncio anuncio = new ENAnuncio(titulo.Text, loc, descripcion.Text, float.Parse(precio.Text), tipoAnun, user, new ENPropiedad());
                            anuncio.categoria = "propiedad";
                            anuncio.usuario.Nif = Session["nif"].ToString();

                            anuncio.prop.superficie = int.Parse(Superficie.Text); //Obligatorio
                            anuncio.prop.tipo = tipoP;
                            anuncio.EsCoche = false;

                            if (NumHabit.Text != "")//Optativo
                                anuncio.prop.habitaciones = int.Parse(NumHabit.Text);
                            if (NumBanyos.Text != "")
                                anuncio.prop.banyos = int.Parse(NumBanyos.Text);
                            if (numCatastral.Text != "")
                                anuncio.prop.numCatastral = numCatastral.Text;

                            if (anuncio.createAnuncio())
                            {
                                ENFoto img = new ENFoto();
                                img.Anuncio.id = anuncio.id;
                                if (img.uploadMultiplImage(cargarimg1.PostedFiles))
                                {
                                    Response.Redirect("~/Anuncio.aspx?anuncio_id=" + anuncio.id);
                                }
                                else
                                {
                                    anuncio.deleteAnuncio();
                                }

                            }
                            else
                            {
                                mensaje.Text = "El anuncio no se ha creado. Intentalo mas tarde.";
                            }
                        }
                    }
                }
            }
        }

        protected void InicioClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
        }
    }
}
