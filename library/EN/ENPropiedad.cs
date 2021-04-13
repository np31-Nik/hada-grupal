using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    /*Datos a introducir:
        Tipo de articulo: Coche o vivienda
        Subtipo: piso, chalet, camioneta
        Si coche: marca
        Si casa: superficie
        Precio
        Direccion
        Codigo Postal
        Descripcion
     */
    class ENPropiedad
    {
        private float _precio;
        private string _descripcion, _tipo, _direccion, _localidad, _titulo;
        private int _cp;
        private int _superficie, _banyos, _habitaciones;
        private int id = 0, //clave primaria
            numCatastral = -1; 

        public float precio
        {
            get { return _precio; }
            set { _precio = value; }
        }
        public string descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }
        public string tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }
        public string direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
        }
        public int cp
        {
            get { return _cp; }
            set { _cp = value; }
        }
        public int superficie
        {
            get { return _superficie; }
            set { _superficie = value; }
        }
        public int banyos
        {
            get { return _banyos; }
            set { _banyos = value; }
        }
        public int habitaciones
        {
            get { return _habitaciones; }
            set { _habitaciones = value; }
        }
        public string localidad
        {
            get { return _localidad; }
            set { _localidad = value; }
        }
        public string titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
        }

        public ENPropiedad() //vacio
        {
            numCatastral = -1;
            precio = 0;
            superficie = 0;
            cp = 0;
            descripcion = "";
            tipo = "";
            direccion = "";
            habitaciones = 0;
            banyos = 0;
            localidad = "";
            titulo = "";
        }

        public ENPropiedad(int catastral,float price, int metros, int cdoPostal, int rooms, int bathrooms,
            string type, string subType, string dir, string description, string city, string title)
        { //Constructor para vivienda
            numCatastral = catastral;
            precio = price;
            superficie = metros;
            cp = cdoPostal;
            descripcion = description;
            tipo = type;
            direccion = dir;
            habitaciones = rooms;
            banyos = bathrooms;
            localidad = city;
            titulo = title;
        }

        //Constructor para vehiculo
        

        public bool crearPropiedad()
        {
            CADPropiedad anuncio = new CADPropiedad();
            if (anuncio.crearPropiedad(this, id))
            {
                id++;
                return true;
            }
            return false;
        }

        //public bool eliminarPropiedad
    }
}
