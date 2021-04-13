using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENAnuncio
    {
        public uint id = 0; //clave primaria
        private string _titulo, _localidad, _descripcion;
        private float _precio;
        private int _cp;
        bool coche = false; //if true creamos coche, else crear propiedad

        public string titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
        }
        public string localidad
        {
            get { return _localidad; }
            set { _localidad = value; }
        }
        public string descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }
        public float precio
        {
            get { return _precio; }
            set { _precio = value; }
        }
        public int cp
        {
            get { return _cp; }
            set { _cp = value; }
        }

        public ENAnuncio()
        {
            titulo = "";
            localidad = "";
            descripcion = "";
            precio = -1;
            cp = -1;
        }
        public ENAnuncio(string title, string city, string description,float price,int codPostal)
        {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            cp = codPostal;
        }

        public bool createAnuncio() {
            CADAnuncio anuncio = new CADAnuncio();
            bool creado = false;
            if (coche)
            {
                ENCoche coche = new ENCoche();
                if (coche.createCoche(id))
                    if (anuncio.createAnuncio(this,id))
                    {
                        creado = true;
                        id++;
                    }
            }
            else
            {
                ENPropiedad prop = new ENPropiedad();
                if (prop.createPropiedad(id))
                    if (anuncio.createAnuncio(this,id))
                    {
                        creado = true;
                        id++;
                    }
            }
            return creado;
        }

        public bool deleteAnuncio() {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
            if (anuncio.deleteAnuncio(this, id))
                deleted = true;
            return deleted;
        }
        public bool updateAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
            if (anuncio.updateAnuncio(this, id))
                deleted = true;

            return deleted;
        }
        public bool readAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
            if (anuncio.readAnuncio(this, id))
                deleted = true;

            return deleted;
        }
    }
}
