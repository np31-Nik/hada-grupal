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
            /*if (Session["nif"] == null)
            {
                Response.Redirect("~/Registros.aspx");
            }*/
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

            if (titulo.Text.Length > 55)
            {
                mensaje.Text = "El tamaño maximo de titulo es de 55 caracteres. Tamaño actual: " + titulo.Text.Length;

            }
            else if (titulo.Text == "")
            {
                mensaje.Text = "Campo titulo es obligatorio";
            }
            else if (descripcion.Text.Length > 1000)
            {
                mensaje.Text = "El tamaño maximo de la descripcion es de 1000 caracteres. Tamaño actual: " + descripcion.ToString().Length;

            }
            else if (descripcion.Text == "")
            {
                mensaje.Text = "Campo descripcion es obligatorio";
            }
            else if (localidad.Text == "0")
            {
                mensaje.Text = "Debe elegir una de las localidades";
            }
            else
            {
                if (RadioButtonList1.SelectedItem.Text == "Vehiculo")
                {
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
                        anuncio.usuario.Nif = "11";//Session["nif"].ToString();


                        anuncio.EsCoche = true;



                        if (anuncio.createAnuncio())
                        {
                            if ((cargarimg1.HasFile || cargarimg1.HasFiles) && cargarimg1.PostedFiles.Count < 10)
                            {
                                try
                                {
                                    bool formatoCorrercto = true;
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
                                    if (formatoCorrercto)
                                    {
                                        ENFoto img = new ENFoto();
                                        img.Anuncio.id = anuncio.id;
                                        if (img.uploadMultiplImage(cargarimg1.PostedFiles))
                                        {
                                            Response.Redirect("~/Anuncio.aspx?anuncio_id=" + anuncio.id);
                                        }
                                    }
                                    else
                                    {
                                        mensaje.Text = "El formato de imagenes debe ser: .png o .jpg o .jpeg";
                                    }
                                }
                                catch (Exception ex)
                                {
                                    mensaje.Text = "Error " + ex;
                                }
                            }
                            else
                            {
                                mensaje.Text = "Debe cargar al menos una imagen (.png o .jpg o . jpeg) pero no mas de 10";
                            }
                            anuncio.deleteAnuncio();
                        }
                        else
                        {
                            mensaje.Text = "El anuncio no se ha creado. Intentelo mas tarde.";
                        }
                    }

                }
                else
                {
                    if (precio.Text == "")
                    {
                        mensaje.Text = "El campo precio es obligatorio";
                    }
                    else if (Superficie.Text == "")
                    {
                        mensaje.Text = "El campo superficie es obligatorio";
                    }
                    else if (TipoCasa.Text == "0")
                    {
                        mensaje.Text = "Debe elgir tipo de propiedad";
                    }
                    else if (NumHabit.Text != "" && int.TryParse(NumHabit.Text, out aux))
                    {
                        mensaje.Text = "Numero de habitaciones debe ser un numero entero";
                    }
                    else if (!int.TryParse(Superficie.Text.ToString(), out aux))
                    {
                        mensaje.Text = "Superficie debe ser un numero entero";
                    }
                    else if (NumBanyos.Text != "" && int.TryParse(NumBanyos.Text, out aux))
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
                            if ((cargarimg1.HasFile || cargarimg1.HasFiles) && cargarimg1.PostedFiles.Count < 10)
                            {
                                try
                                {
                                    bool formatoCorrercto = true;
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
                                    if (formatoCorrercto)
                                    {
                                        ENFoto img = new ENFoto();
                                        img.Anuncio.id = anuncio.id;
                                        if (img.uploadMultiplImage(cargarimg1.PostedFiles))
                                        {
                                            Response.Redirect("~/Anuncio.aspx?anuncio_id=" + anuncio.id);
                                        }
                                    }
                                    else
                                    {
                                        mensaje.Text = "El formato de imagenes debe ser: .png o .jpg o .jpeg";
                                    }
                                }
                                catch (Exception ex)
                                {
                                    mensaje.Text = "Error " + ex;
                                }
                            }
                            else
                            {
                                mensaje.Text = "Debe cargar al menos una imagen (.png o .jpg o . jpeg) pero no mas de 10";
                            }
                            anuncio.deleteAnuncio();
                        }
                        else
                        {
                            mensaje.Text = "El anuncio no se ha creado. Intentelo mas tarde.";
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
