using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENTipoAnuncio
    {
        private string _tipo;
        public string Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        public ENTipoAnuncio()
        {
            Tipo = "";
        }
        public ENTipoAnuncio(string tipo)
        {
            Tipo = tipo;
        }
    }
}
