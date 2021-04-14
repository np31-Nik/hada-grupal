using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library.EN
{
    class ENBanco
    {
        private string banco;

        private int telefono;

        private string email;

        public string BANCO
        {
            get { return banco; }
            set { banco = value; }
        }
        public int TELEFONO
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string EMAIL 
        {
            get { return email; }
            set { email = value; }
        }
    }
}
