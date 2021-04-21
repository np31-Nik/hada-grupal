using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library
{
    public class CADTipoPropiedad
    {
        private string constring;

        public CADTipoPropiedad()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            return success;
        }

        public bool readTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            return success;
        }

        public bool deleteTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            return success;
        }

        public bool editTipoPropiedad(ENTipoPropiedad en, string T)
        {
            bool success = false;

            return success;
        }

        public bool readNextTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            return success;
        }

        public bool readFirstTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            return success;
        }
    }
}
