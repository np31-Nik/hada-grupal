using System.Collections.Generic;
using System.Web;

namespace library
{
    public class ENFoto
    {
        private int _id;
        private byte[] _foto;
        private ENAnuncio _anuncio;
        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }
        public byte[] Foto
        {
            get { return _foto; }
            set { _foto = value; }
        }
        public ENAnuncio Anuncio
        {
            get { return _anuncio; }
            set { _anuncio = value; }
        }
        public ENFoto()
        {
            Foto = null;
            Anuncio = new ENAnuncio();
        }
        public ENFoto(byte[] foto, ENAnuncio anuncio)
        {
            ID = -1;
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
            if (ID != -1)
            {
                CADFoto db = new CADFoto();
                return db.updateFoto(this);
            }
            return false;
        }
        /// <summary>
        /// Borra esta foto de la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool deleteFoto()
        {
            if (ID != -1)
            {
                CADFoto db = new CADFoto();
                return db.deleteFoto(this);
            }
            return false;
        }
        public bool readFoto()
        {
            if (ID != -1)
            {
                CADFoto db = new CADFoto();
                return db.readFoto(this);
            }
            return false;
        }
        /// <summary>
        /// Funcion para subir multiples imagenes
        /// </summary>
        /// <param name="files"> PostedFiles del FileUpluad, ej: FileUpluad.PostedFiles</param>
        /// <returns>True si consige y False si no</returns>
        public bool uploadMultiplImage(IList<HttpPostedFile> files)
        {
            CADFoto db = new CADFoto();
            return db.uploadMultiplImage(this, files);
        }
    }
}
