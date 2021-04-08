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
    class ENPublicar
    {
        private float _precio;
        private string _descripcion, _tipo, _subTipo, _marca = null, _direccion, _localidad,_titulo;
        private int _cp;
        private int _superficie,_banyos, _habitaciones;
        private int id = 0; //clave primaria

        public float precio{
            get{ return _precio; }
            set { _precio = value; } 
        }
        public string descripcion
        {
            get { return _descripcion; }
            set {  _descripcion= value; }
        }
        public string tipo 
        {
            get { return _tipo; }
            set { _tipo = value; }
        }
        public string subTipo
        {
            get { return _subTipo; }
            set { _subTipo = value; }
        }
        public string marca
        {
            get { return _marca; }
            set {  _marca= value; }
        }
        public string direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
        }
        public int cp
        {
            get { return _cp ; }
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
        public int habitacion
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

        public ENPublicar() //vacio
        {
            precio = 0;
            superficie = 0;
            cp = 0;
            descripcion = "";
            tipo = "";
            subTipo = "";
            marca = "";
            direccion = "";
            habitacion = 0;
            banyos = 0;
            localidad = "";
            titulo = "";
        }

        public ENPublicar(float price, int metros, int cdoPostal, int rooms, int bathrooms,
            string type, string subType, string dir, string description,string city, string title) { //Constructor para vivienda

            precio = price;
            superficie = metros;
            cp = cdoPostal;
            descripcion = description;
            tipo = type;
            subTipo = subType;
            direccion = dir;
            habitacion = rooms;
            banyos = bathrooms;
            localidad = city;
            titulo = title;
            marca = null;
        }

        //Constructor para vehiculo
        public ENPublicar(float price,string type, String subType, int cdoPostal,string dir,
            string description, string city, string marcaParam, string title)
        {
            precio = price;
            descripcion = description;
            cp = cdoPostal;
            tipo = type;
            subTipo = subType;
            direccion = dir;
            localidad = city;
            marca = marcaParam;
            titulo = title;
            habitacion = -1;
            banyos = -1;
            superficie = -1;
        }

        public bool crearAnuncio() {
            CADPublicar anuncio = new CADPublicar();
            if (anuncio.crearAnuncio(this,id))
            {
                id++;
                return true;
            }
            return false;
        }
    }
}
