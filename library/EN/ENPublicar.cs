using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library.EN
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
        private string _descripcion, _tipo, _subTipo, _marca = null, _direccion, _localidad;
        private int _cp;
        private int _superficie,_banyos, _habitaciones;

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
        }

        public ENPublicar(float price, int metros, int cdoPostal, int rooms, int bathrooms,
            string type, string subType, string dir, string description,string city) { //Constructor para vivienda

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
        }

        //Constructor para vehiculo
        public ENPublicar(float price,string type, String subType, string dir, string description, string city)
        {
            precio = price;
            descripcion = description;
            tipo = type;
            subTipo = subType;
            direccion = dir;
            localidad = city;
        }
    }
}
