using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library
{
    public class CADMarcaCoche

    {

        private string constring;

        public CADMarcaCoche()
        {
           // constring = constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool readMarcaCoche(ENMarcaCoche m)
        {
            bool leer = false;

            return leer ;
        }

        public bool createMarcaCoche(ENMarcaCoche m)
        {
            bool crear = false;

            return crear;
        }

        public bool deleteMarcaCoche(ENMarcaCoche m)
        {
            bool borrar = false;

            return borrar;
        }

        public bool updateMarcaCoche(ENMarcaCoche m)
        {
            bool actualizar = false;

            return actualizar;
        }

        public bool readNextMarcaCoche(ENMarcaCoche m)
        {
            bool leer= false;

            return leer;
        }

        public bool readFirstMarcaCoche(ENMarcaCoche c)
        {
            bool leer = false;

            return leer;
        }
    }
}
