using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using System.Configuration;

namespace library
{
    class CADBanco
    {
        public CADBanco()
        {

        }

        public bool createBanco(ENBanco en)
        {
            bool creado = false;
            return creado;
        }

        public bool deleteBanco(ENBanco en)
        {
            bool eliminado = false;
            return eliminado;
        }

        public bool readBanco(ENBanco en)
        {
            bool leido = false;
            return leido;
        }

        public bool readFirstBanco(ENBanco en)
        {
            bool leido = false;
            return leido;
        }

        public bool readNextBanco(ENBanco en)
        {
            bool leido = false;
            return leido;
        }

        public bool readPrevBanco(ENBanco en)
        {
            bool leido = false;
            return leido;
        }

        public bool updateBanco(ENBanco en)
        {
            bool act = false;
            return act;
        }
    }
}
