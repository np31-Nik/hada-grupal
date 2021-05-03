using System.Configuration;

namespace library
{
    public class CADAnuncio
    {
        private string constring;
        public CADAnuncio()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString();//Conexion
        }

        public bool createAnuncio(ENAnuncio en, uint id)
        {
            bool creado = false;


            return creado;
        }
        public bool deleteAnuncio(ENAnuncio en, uint id)
        {
            bool deleted = false;


            return deleted;
        }
        public bool readAnuncio(ENAnuncio en, uint id)
        {
            bool read = false;


            return read;
        }
        public bool readFirstAnuncio(ENAnuncio en, uint id)
        {
            bool updated = false;


            return updated;
        }
        public bool readNextAnuncio(ENAnuncio en, uint id)
        {
            bool updated = false;


            return updated;
        }
        public bool updateAnuncio(ENAnuncio en, uint id)
        {
            bool updated = false;


            return updated;
        }

    }
}
