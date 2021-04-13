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

        public bool createAnuncio()
        {
            bool creado = false;


            return creado;
        }
        public bool deletAnuncio()
        {
            bool deleted = false;


            return deleted;
        }
        public bool readAnuncio()
        {
            bool read = false;


            return read;
        }
        public bool updateAnuncio()
        {
            bool updated = false;


            return updated;
        }
    }
}
