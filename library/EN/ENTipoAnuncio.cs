namespace library
{
    public class ENTipoAnuncio
    {
        private string _tipo;
        private string _newTipo;
        public string NewTipo
        {
            get { return _newTipo; }
            set { _newTipo = value; }
        }
        public string Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }
        public ENTipoAnuncio()
        {
            Tipo = "";
            NewTipo = "";
        }
        public ENTipoAnuncio(string tipo)
        {
            Tipo = tipo;
        }
        public ENTipoAnuncio(string tipo, string newTipo)
        {
            Tipo = tipo;
            NewTipo = newTipo;
        }
        public bool createTipoAnuncio()
        {
            CADTipoAnuncio db = new CADTipoAnuncio();
            return db.createTipoAnuncio(this);
        }
        public bool updateTipoAnuncio()
        {
            if (NewTipo != "")
            {
                CADTipoAnuncio db = new CADTipoAnuncio();
                return db.updateTipoAnuncio(this);
            }
            return false;
        }
        public bool deleteTipoAnuncio()
        {
            CADTipoAnuncio db = new CADTipoAnuncio();
            return db.deleteTipoAnuncio(this);
        }
        public bool readTipoAnuncio()
        {
            CADTipoAnuncio db = new CADTipoAnuncio();
            return db.readTipoAnuncio(this);
        }

        /*public bool readFirstTipoAnuncio(ENTipoAnuncio en)
        {
             CADTipoAnuncio db = new CADTipoAnuncio();
            return db.readFirstTipoAnuncio(this);
        }

        public bool readNextTipoAnuncio(ENTipoAnuncio en)
        {
             CADTipoAnuncio db = new CADTipoAnuncio();
            return db.readNextTipoAnuncio(this);
        }

        public bool readPrevTipoAnuncio()
        {
             CADTipoAnuncio db = new CADTipoAnuncio();
            return db.readPrevTipoAnuncio(this);
        }*/
    }
}
