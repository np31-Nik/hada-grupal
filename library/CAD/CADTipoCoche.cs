using library.EN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library.CAD
{
    public class CADTipoCoche
    {
        private string constring;


        public CADTipoCoche()
        {
            //constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createTipoCoche(ENTipoCoche en)
        {
            bool leer = false;

            return leer;
        }

        public bool readTipoCoche(ENTipoCoche en)
        {
            bool leer = false;

            return leer;
        }

        public bool deleteTipoCoche(ENTipoCoche en)
        {
            bool borrar = false;

            return borrar;
        }

        public bool updateTipoCoche(ENTipoCoche en, string apariencia)
        {
            bool editar = false;

            return editar;
        }

        public bool readNextTipoCoche(ENTipoCoche en)
        {
            bool leer = false;

            return leer;
        }

        public bool readFirstTipoCoche(ENTipoCoche en)
        {
            bool success = false;

            return success;
        }
    }
}
