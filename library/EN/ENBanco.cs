using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
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

        public ENBanco()
        {
            BANCO = "";
            TELEFONO = 0;
            EMAIL = "";
        }

        public ENBanco(string banco, int telefono, string email)
        {
            BANCO = banco;
            TELEFONO = telefono;
            EMAIL = email;
        }

        public bool createBanco()
        {
            CADBanco cadb = new CADBanco();
            bool creado = cadb.createBanco(this);
            return creado;
        }

        public bool deleteBanco()
        {
            CADBanco cadb = new CADBanco();
            bool eliminado = cadb.deleteBanco(this);
            return eliminado;
        }

        public bool updateBanco()
        {
            CADBanco cadb = new CADBanco();
            bool act = cadb.updateBanco(this);
            return act;
        }

        public bool readBanco()
        {
            CADBanco cadb = new CADBanco();
            bool leido = cadb.readBanco(this);
            return leido;
        }

        public bool readFirstBanco()
        {
            CADBanco cadb = new CADBanco();
            bool leido = cadb.readFirstBanco(this);
            return leido;
        }

        public bool readNextBanco()
        {
            CADBanco cadb = new CADBanco();
            bool leido = cadb.readNextBanco(this);
            return leido;
        }

        public bool readPrevBanco()
        {
            CADBanco cadb = new CADBanco();
            bool leido = cadb.readPrevBanco(this);
            return leido;
        }
    }
}
