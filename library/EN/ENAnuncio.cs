namespace library
{
    public class ENAnuncio
    {
        public ENTipoAnuncio tipo;
        public ENCoche coche;
        public ENPropiedad prop;
        public ENLocalidad localidad;
        public ENTipoPropiedad tipoProp;
        public uint id = 0; //clave primaria
        private string _titulo, _descripcion;
        private float _precio;

        public bool EsCoche = false; //if true creamos coche, else crear propiedad

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


        public ENAnuncio()
        {
            titulo = "";
            localidad = new ENLocalidad();
            descripcion = "";
            precio = -1;
            tipo = new ENTipoAnuncio();
        }
        public ENAnuncio(string title, ENLocalidad city, string description, float price, ENTipoAnuncio tipoAnuncio)
        {
            titulo = title;
            localidad = city;
            descripcion = description;
            precio = price;
            tipo = tipoAnuncio;
        }

        public bool createAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool creado = false;
            if (EsCoche)
            {
                if (coche.createCoche(id))
                    if (anuncio.createAnuncio(this, id))
                    {
                        creado = true;
                        id++;
                    }
            }
            else
            {
                ENPropiedad prop = new ENPropiedad();
                if (prop.createPropiedad(id))
                    if (anuncio.createAnuncio(this, id))
                    {
                        creado = true;
                        id++;
                    }
            }
            return creado;
        }

        public bool deleteAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool deleted = false;
            if (anuncio.readAnuncio(this, id))
            {
                if (anuncio.deleteAnuncio(this, id))
                    deleted = true;
            }
            return deleted;
        }
        public bool updateAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool updated = false;
            if (anuncio.readAnuncio(this, id))
            {
                if (anuncio.updateAnuncio(this, id))
                    updated = true;
            }

            return updated;
        }
        public bool readAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readAnuncio(this, id))
                read = true;

            return read;
        }
        public bool readNextAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readNextAnuncio(this, id))
                read = true;

            return read;
        }
        public bool readFirstAnuncio()
        {
            CADAnuncio anuncio = new CADAnuncio();
            bool read = false;
            if (anuncio.readFirstAnuncio(this, id))
                read = true;

            return read;
        }
    }
}
