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
    class CADHipoteca
    {
        private String conexstring;

        public CADHipoteca()
        {
            
        }

        public bool createHipoteca(ENHipoteca en) 
        {
            bool creado = false;
            return creado;
        }

        public bool deleteHipoteca(ENHipoteca en)
        {
            bool eliminado = false;
            return eliminado;
        }

        public bool readHipoteca(ENHipoteca en)
        {
            bool leido = false;
            return leido;
        }

        public bool readFirstHipoteca(ENHipoteca en)
        {
            bool leido = false;
            return leido;
        }

        public bool readNextHipoteca(ENHipoteca en)
        {
            bool leido = false;
            return leido;
        }

        public bool readPrevHipoteca(ENHipoteca en)
        {
            bool leido = false;
            return leido;
        }

        public bool updateHipoteca(ENHipoteca en)
        {
            bool act = false;
            return act;
        }
    }
}
