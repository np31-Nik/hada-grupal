namespace library
{
    public class ENPropiedad
    {
        private string _direccion;
        private int _superficie, _banyos, _habitaciones;
        private int _numCatastral = -1;
        ENTipoPropiedad tipo;



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

        public int numCatastral
        {
            get { return _numCatastral; }
            set { _numCatastral = value; }
        }

        public ENPropiedad() //vacio
        {
            numCatastral = -1;
            superficie = 0;
            tipo = new ENTipoPropiedad();
            direccion = "";
            habitaciones = 0;
            banyos = 0;
        }

        public ENPropiedad(int catastral, int metros, int rooms, int bathrooms,
            ENTipoPropiedad type, string subType, string dir)
        { //Constructor para vivienda
            numCatastral = catastral;
            superficie = metros;
            tipo = type;
            direccion = dir;
            habitaciones = rooms;
            banyos = bathrooms;
        }

        //Constructor para vehiculo


        public bool createPropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            if (prop.createPropiedad(this, id))
            {
                return true;
            }
            return false;
        }

        public bool deletePropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            return prop.deletePropiedad(this, id);
        }

        public bool updatePropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            return prop.updatePropiedad(this, id);
        }

        public bool readPropiedad(uint id)
        {
            CADPropiedad prop = new CADPropiedad();
            return prop.readPropiedad(this, id);

        }
    }
}
