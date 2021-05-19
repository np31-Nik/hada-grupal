using System;
using System.Collections.Generic;
using System.Data;
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

            /*localidad.Items.Add("pepepepep");
            localidad.SelectedIndex


            //seguramente dengas que devolver un dataTable de la base de datos porque devuelves todo la table
            //entonces seria algo asi
            foreach (DataRow item in listaDeLaBaseDeDatos.Rows)
            { //for que recorre todos los item de la bbdd
                localidad.Items.Add(item.localidad); //meto cada item en el ListItem
                list.Add(item); // set todo el item en el array
            }

            //---------------------------
            foreach (ENLocalidad item in listaDeLaBaseDeDatos) { //for que recorre todos los item de la bbdd
                localidad.Items.Add(item.localidad); //meto cada item en el ListItem
                list.Add(item); // set todo el item en el array
            }
            //si quieres seleccionar todo el item que se ha pulsado
            //en el SelectedIndezChaged haces
            int pos = localidad.SelectedIndex; //recogo el index seleccionado
            ENLocalidad currentLocalidad = list[pos]; //busco el item entero en la lista
            // full gucci
            */
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
            int aux = 0;
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
                        ENLocalidad loc = new ENLocalidad(localidad.SelectedItem.Text);
                        ENTipoAnuncio tipoAnun = new ENTipoAnuncio(tipoAnuncio.SelectedItem.Text);
                        ENMarcaCoche marcaC = new ENMarcaCoche("", marca.SelectedItem.Text, "");
                        ENTipoCoche tipoC = new ENTipoCoche(tipoCoche.SelectedItem.Text); 
                        ENCoche car = new ENCoche(int.Parse(anyo.Text), tipoC, marcaC);
                        ENAnuncio anuncio = new ENAnuncio(titulo.Text, loc, descripcion.Text, float.Parse(precioVehiculo.Text),tipoAnun,car);
                        
                        
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
                    else if (TipoCasa.Text == "0")
                    {
                        mensaje.Text = "Debe elgir tipo de propiedad";
                    }
                    else if (NumHabit.Text != "" && int.TryParse(NumHabit.Text, out aux)) {
                        mensaje.Text = "Numero de habitaciones debe ser un numero entero";
                    }
                    else if (int.TryParse(Superficie.Text, out aux))
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

                        ENAnuncio anuncio = new ENAnuncio(titulo.Text, loc, descripcion.Text, float.Parse(precio.Text), tipoAnun, new ENPropiedad());


                        anuncio.prop.superficie = int.Parse(Superficie.Text); //Obligatorio
                        anuncio.tipoProp = tipoP;
                        anuncio.EsCoche = false;

                        if (NumHabit.Text!="")//Optativo
                            anuncio.prop.habitaciones = int.Parse(NumHabit.Text);
                        if (NumBanyos.Text!="")
                            anuncio.prop.banyos = int.Parse(NumBanyos.Text);
                        if (numCatastral.Text != "")
                            anuncio.prop.numCatastral = numCatastral.Text;

                        if (anuncio.createAnuncio())
                        {
                            mensaje.Text = "Anuncio creado correctamente";//quitar al acabar
                            //Ir a la pagina de anuncio creado
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
            mensaje.Text = "";
        }
    }
}
