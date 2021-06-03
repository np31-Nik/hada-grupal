using System;
using System.Data;

namespace library
{
    public class ENAnuncio
    {
        public ENTipoAnuncio _tipo;
        public ENCoche _coche;
        public ENPropiedad _prop;
        public ENLocalidad _localidad;
        public ENTipoPropiedad _tipoProp;
        public ENUsuario _usuario;
        public int id = 0; //clave primaria
        private string _titulo, _descripcion,_categoria;
        private float _precio;

        public bool EsCoche = false; //if true creamos coche, else crear propiedad

        public ENTipoAnuncio tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }
        public ENCoche coche
        {
            get { return _coche; }
            set { _coche = value; }
        }
        public ENPropiedad prop
        {
            get { return _prop; }
            set { _prop = value; }
        }
        public ENLocalidad localidad
        {
            get { return _localidad; }
            set { _localidad = value; }
        }
        public ENTipoPropiedad tipoProp
        {
            get { return _tipoProp; }
            set { _tipoProp = value; }
        }
        public ENUsuario usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }
        public string categoria
        {
            get { return _categoria; }
            set { _categoria = value; }
        }
        public string titulo
        {
            get { return _titulo; }
            set { _titulo = value; }
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

        //Constructor vacio
        public ENAnuncio()
        {
            titulo = "";
            localidad = new ENLocalidad();
            descripcion = "";
            precio = -1;
            tipo = new ENTipoAnuncio();
            usuario = new ENUsuario();
            prop = new ENPropiedad();
            coche = new ENCoche();
        }

        //Constructor para Vehiculo
        public ENAnuncio(string title, ENLocalidad city, string description, float price, ENTipoAnuncio tipoAnuncio,ENUsuario user ,ENCoche car)
        {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            tipo = tipoAnuncio;
            usuario = user;
            coche = car;
        }

        //Constructor para Propiedad
        public ENAnuncio(string title, ENLocalidad city, string description, float price,
            ENTipoAnuncio tipoAnuncio, ENUsuario user, ENPropiedad propiedad) {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            tipo = tipoAnuncio;
            usuario = user;
            prop = propiedad ;
        }

        public bool createAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool creado = false;
            if (categoria=="Coche")
            {
                if (anuncio.createAnuncio(this))
                {
                    id = readUltimoId(this.usuario);
                    if (coche.createCoche(coche, id))
                    {
                        creado = true;
                    }
                }
            }
            else if(categoria == "Propiedad")
            {
                if (anuncio.createAnuncio(this))
                {
                    id = readUltimoId(this.usuario);
                    if (prop.createPropiedad(prop,id))
                    {
                        creado = true;
                    }
                }
            }
            return creado;
        }

        private int readUltimoId(ENUsuario usuario)
        {
            CADAnuncio anuncio = new CADAnuncio();
            return anuncio.readUltimoId(usuario);
        }

        public bool deleteAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
                if (anuncio.deleteAnuncio(this))
                    deleted = true;
            return deleted;
        }

        public bool updateAnuncio()//REVISAR
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool updated = false;
            if (anuncio.updateAnuncio(this))
            {
                if (categoria == "Coche")
                    coche.id = this.id;
                if (coche.updateCoche(coche))
                    updated = true;
                else if (categoria == "Propiedad")
                    prop.id = this.id;
                    if (prop.updatePropiedad(prop))
                        updated = true;
            }

            return updated;
        }

        public bool readAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readAnuncio(this))
            {
                if (categoria == "Coche")
                {
                    coche.id = this.id;
                    if (coche.readCoche(coche))
                        read = true;
                }
                else if (categoria == "Propiedad") {
                    prop.id = this.id;
                    if (prop.readPropiedad(prop))
                        read = true;
                }
            }
            return read;
        }
        public bool readNextAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readNextAnuncio(this))
                read = true;

            return read;
        }
        public bool readFirstAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readFirstAnuncio(this))
                read = true;

            return read;
        }
        public DataSet BusquedaAnuncios(string cmd_a, string cmd_b,string tabla, ref bool success)
        {
            CADAnuncio anuncio = new CADAnuncio();
            success = false;
            DataSet ds = anuncio.BusquedaAnuncios(cmd_a, cmd_b,tabla, ref success);
            return ds;
        }

    }
}
