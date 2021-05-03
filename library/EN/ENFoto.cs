namespace library
{
    public class ENFoto
    {
        private byte[] _foto;
        private ENAnuncio _anuncio;
        public byte[] Foto
        {
            get { return _foto; }
            set { _foto = value; }
        }
        public ENAnuncio Anuncio
        {
            get { return Anuncio; }
            set { Anuncio = value; }
        }
        public ENFoto()
        {
            Foto = null;
            Anuncio = new ENAnuncio();
        }
        public ENFoto(byte[] foto, ENAnuncio anuncio)
        {
            Foto = foto;
            Anuncio = anuncio;
        }
        /// <summary>
        /// Guarda esta Foto en la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool createFoto()
        {
            CADFoto db = new CADFoto();
            return db.createFoto(this);
        }
        /// <summary>
        /// Recupera la primera foto de la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readFirstFoto()
        {
            CADFoto db = new CADFoto();
            return db.readFirstFoto(this);
        }
        /// <summary>
        /// Recupera la siguente foto del Anuncio.
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readNextFoto()
        {
            CADFoto db = new CADFoto();
            return db.readNextFoto(this);
        }
        /// <summary>
        /// Recupera a la foto anterior del Anuncio.
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readPrevFoto()
        {
            CADFoto db = new CADFoto();
            return db.readPrevFoto(this);
        }
        /// <summary>
        /// Actualiza esta foto en la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool updateFoto()
        {
            CADFoto db = new CADFoto();
            return db.updateFoto(this);
        }
        /// <summary>
        /// Borra esta foto de la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool deleteFoto()
        {
            CADFoto db = new CADFoto();
            return db.deleteFoto(this);
        }
    }
}
