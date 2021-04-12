using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENCoche
    {
        private float _precio;
        private string _descripcion, _tipo, _subTipo, _marca = null, _direccion, _localidad, _titulo;
        private int _cp,_anyo;
        private int id = 0; //clave primaria

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

        public string marca
        {
            get { return _marca; }
            set { _marca = value; }
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

        public int anyo
        {
            get { return _anyo; }
            set { _anyo = value; }
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
        public ENCoche(int year, float price, string type, String subType, int cdoPostal, string dir,
            string description, string city, string marcaParam, string title)
        {
            precio = price;
            descripcion = description;
            cp = cdoPostal;
            tipo = type;
            direccion = dir;
            localidad = city;
            marca = marcaParam;
            titulo = title;
            anyo = year;

        }
        public bool crearCoche()
        {
            CADCoche anuncio = new CADCoche();
            if (anuncio.crearCoche(this, id))
            {
                id++;
                return true;
            }
            return false;
        }
    }
}
