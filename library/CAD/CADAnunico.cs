using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library
{
    class CADAnuncio
    {
        private string constring;
        public CADAnuncio()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
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
        public bool updateAnuncio(ENAnuncio en, uint id)
        {
            bool updated = false;


            return updated;
        }
    }
}
