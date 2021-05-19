namespace library
{
    public class ENPropiedad
    {
        private string _direccion;
        private int _superficie, _banyos, _habitaciones;
        private string _numCatastral = "-1";
        private int _id;
        ENTipoPropiedad _tipo;

        public ENTipoPropiedad tipo {
            get { return _tipo; }
            set { _tipo = value; }
        }

        public string direccion
        {
            get { return _direccion; }
            set { _direccion = value; }
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

        public string numCatastral
        {
            get { return _numCatastral; }
            set { _numCatastral = value; }
        }
        public int id
        {
            get { return (int)_id; }
            set { _id = value; }
        }

        public ENPropiedad() //vacio
        {
            numCatastral = "-1";
            superficie = 0;
            tipo = new ENTipoPropiedad();
            direccion = "";
            habitaciones = 0;
            banyos = 0;
        }

        public ENPropiedad(string catastral, int metros, int rooms, int bathrooms,
            ENTipoPropiedad type, string subType, string dir)
        { //Constructor para vivienda
            numCatastral = catastral;
            superficie = metros;
            tipo = type;
            direccion = dir;
            habitaciones = rooms;
            banyos = bathrooms;
        }

        public bool createPropiedad(ENPropiedad propiedad, int idParam)
        {
            CADPropiedad prop = new CADPropiedad();
            propiedad.id = idParam;
            if (prop.createPropiedad(propiedad))
            {
                return true;
            }
            return false;
        }

        public bool deletePropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            if(prop.readPropiedad(this,id))
                return prop.deletePropiedad(this, id);
            return false;
        }

        public bool updatePropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            if (prop.readPropiedad(this, id))
                return prop.updatePropiedad(this, id);
            return false;
        }

        public bool readPropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            return prop.readPropiedad(this, id);

        }
    }
}
