﻿using System;

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
        public uint id = 0; //clave primaria
        private string _titulo, _descripcion;
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
        }

        //Constructor para Vehiculo
        public ENAnuncio(string title, ENLocalidad city, string description, float price, ENTipoAnuncio tipoAnuncio,ENCoche car)
        {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            tipo = tipoAnuncio;
            coche = car;
        }

        //Constructor para Propiedad
        public ENAnuncio(string title, ENLocalidad city, string description, float price, ENTipoAnuncio tipoAnuncio, ENPropiedad propiedad) {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            tipo = tipoAnuncio;
            prop = propiedad ;
        }
        public bool createAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool creado = false;
            if (EsCoche)
            {
                if (anuncio.createAnuncio(this))
                    id = readUltimoId(this.usuario);
                    if (coche.createCoche(coche,id))
                    {
                        creado = true;
                    }
            }
            else
            {
                if (anuncio.createAnuncio(this))
                    if (prop.createPropiedad(prop))
                    {
                        creado = true;
                        id++;
                    }
            }
            return creado;
        }

        private uint readUltimoId(ENUsuario usuario)
        {
            CADAnuncio anuncio = new CADAnuncio();
            return anuncio.readUltimoId(usuario);
        }

        public bool deleteAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
            if (anuncio.readAnuncio(this))
            {
                if (anuncio.deleteAnuncio(this))
                    deleted = true;
            }
            return deleted;
        }
        public bool updateAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool updated = false;
            if (anuncio.readAnuncio(this))
            {
                if (anuncio.updateAnuncio(this))
                    updated = true;
            }

            return updated;
        }
        public bool readAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readAnuncio(this))
                read = true;

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
    }
}
