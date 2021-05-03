namespace library
{
    public class ENTipoAnuncio
    {
        private string _tipo;
        public string Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }
        public ENTipoAnuncio()
        {
            Tipo = "";
        }
        public ENTipoAnuncio(string tipo)
        {
            Tipo = tipo;
        }

        public bool createTipoAnuncio()
        {
            CADTipoAnuncio db = new CADTipoAnuncio();
            return db.createTipoAnuncio(this);
        }
        public bool updateTipoAnuncio()
        {
            CADTipoAnuncio db = new CADTipoAnuncio();
            return db.updateTipoAnuncio(this);
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
