using System;
using library;

namespace UserInterface
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mensaje.Text = "";
            vehiculo.Visible = true;
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
            if (RadioButtonList2.SelectedItem.Text == "Alquiler")
            {
                precioProp.Text = "Precio por mes:";
            }
            else if (RadioButtonList2.SelectedItem.Text == "Venta")
            {
                precioProp.Text = "Precio de venta:";
            }
        }

        protected void PublicarClick(object sender, EventArgs e)
        {
            if (titulo.Text.Length > 55)
            {
                mensaje.Text = "El tamaño maximo de titulo es de 55 caracteres. Tamaño actual: " + titulo.Text.Length;

            }
            else if (titulo.Text == "") {
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
                if (RadioButtonList1.SelectedItem.Text == "Vehiculo") {
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
                        ENAnuncio anuncio = new ENAnuncio();
                        ENMarcaCoche marcaC = new ENMarcaCoche("", marca.SelectedItem.Text,"") ;
                        ENTipoCoche tipoC = new ENTipoCoche(tipoCoche.SelectedItem.Text);
                        ENLocalidad loc = new ENLocalidad(localidad.SelectedItem.Text);
                        ENCoche car = new ENCoche();
                        anuncio.titulo = titulo.Text;
                        anuncio.descripcion = descripcion.Text;
                        anuncio.precio = float.Parse(precioVehiculo.Text);
                        anuncio.localidad = loc;
                        anuncio.coche = car;
                        anuncio.coche.marca = marcaC;
                        anuncio.coche.tipo = tipoC;
                        anuncio.coche.anyo= int.Parse(anyo.Text);
                        anuncio.EsCoche = true;
                        if (anuncio.createAnuncio()) {
                            //Ir a la pagina de inicio o pagina de anuncio creado
                        }
                        else{
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
                    else if (Superficie.Text == "0")
                    {
                        mensaje.Text = "Debe elgir tipo de propiedad";
                    }
                    else {
                        ENAnuncio anuncio = new ENAnuncio();
                        ENMarcaCoche marcaC = new ENMarcaCoche("", marca.SelectedItem.Text, "");
                        ENTipoCoche tipoC = new ENTipoCoche(tipoCoche.SelectedItem.Text);
                        ENPropiedad propiedadAnuncio = new ENPropiedad(); 
                        anuncio.titulo = titulo.Text;
                        anuncio.descripcion = descripcion.Text;
                        anuncio.precio = float.Parse(precio.Text);

                        anuncio.prop = propiedadAnuncio;

                        anuncio.EsCoche = false;
                        if (anuncio.createAnuncio())
                        {
                            //Ir a la pagina de inicio o pagina de anuncio creado
                        }
                        else
                        {
                            mensaje.Text = "El anuncio no se ha creado. Intentelo mas tarde.";
                        }
                    }
                }

                }

            }
        }
        protected void InicioClick(object sender, EventArgs e)
        {
            mensaje.Text = "";
        }
    }
}
