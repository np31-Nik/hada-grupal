using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library
{
    public class CADComentario
    {
        private string constring;

        public CADComentario()
        {
            constring = constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public int getId()
        {
            int id = 0;

            return id;
        }

        public bool readComentario(ENComentario c)
        {
            bool success = false;



            return success;
        }

        public bool createComentario(ENComentario c)
        {
            bool success = false;

            return success;
        }

        public bool deleteComentario(ENComentario c)
        {
            bool success = false;

            return success;
        }

        public bool editComentario(ENComentario c)
        {
            bool success = false;

            return success;
        }

        public bool readNextComentario(ENComentario c)
        {
            bool success = false;

            return success;
        }
    }
}
