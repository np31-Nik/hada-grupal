namespace library
{
    public class ENTipoPropiedad
    {
        private string _tipo;
        public string tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        private string _newTipo;
        public string NewTipo
        {
            get { return _newTipo; }
            set { _newTipo = value; }
        }

        public ENTipoPropiedad()
        {
            tipo = "";
        }

        public ENTipoPropiedad(string t)
        {
            tipo = t;
        }

        public ENTipoPropiedad(ENTipoPropiedad T)
        {
            this.tipo = T.tipo;
        }

        public bool readTipoPropiedad()
        {
            CADTipoPropiedad cad = new CADTipoPropiedad();
            bool success = cad.readTipoPropiedad(this);
            return success;
        }

        public bool createTipoPropiedad()
        {
            bool success = false;
            CADTipoPropiedad cad = new CADTipoPropiedad();
            if (!(cad.readTipoPropiedad(this)))
            {
                success = cad.createTipoPropiedad(this);
            }
            return success;
        }

        public bool deleteTipoPropiedad()
        {
            bool success = false;
            CADTipoPropiedad cad = new CADTipoPropiedad();
            if (cad.readTipoPropiedad(this))
            {
                success = cad.deleteTipoPropiedad(this);
            }
            return success;

        }

        public bool updateTipoPropiedad(string T)
        {
            bool success = false;
            NewTipo = T;
            CADTipoPropiedad cad = new CADTipoPropiedad();
            if (cad.readTipoPropiedad(this))
            {
                success = cad.updateTipoPropiedad(this);
            }
            return success;
        }

        public bool readNextTipoPropiedad()
        {
            bool success = false;
            CADTipoPropiedad cad = new CADTipoPropiedad();
            if (cad.readTipoPropiedad(this))
            {
                success = cad.readNextTipoPropiedad(this);
            }
            return success;
        }

        public bool readFirstTipoPropiedad()
        {
            CADTipoPropiedad cad = new CADTipoPropiedad();
            bool success = cad.readFirstTipoPropiedad(this);
            return success;
        }
    }
}
