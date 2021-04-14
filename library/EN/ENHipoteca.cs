using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library.EN
{
    class ENHipoteca
    {
        private int id;

        private DateTime Fechadesde;

        private DateTime Fechahasta;

        private float intereses;

        private int numSolicitudes;

        private string banco;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public string FECHADESDE
        {
            get { return Fechadesde; }
            set { Fechadesde = value; }
        }

        public string FECHAHASTA
        {
            get { return Fechahasta; }
            set { Fechahasta = value; }
        }

        public float INTERESES
        {
            get { return intereses; }
            set { intereses = value; }
        }

        public int NUMSOLICITUDES
        {
            get { return numSolicitudes; }
            set { numSolicitudes = value; }
        }

        public string BANCO
        {
            get { return banco; }
            set { banco = value; }
        }
    }
}
