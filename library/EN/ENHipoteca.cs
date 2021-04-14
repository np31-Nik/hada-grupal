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

        public DateTime FECHADESDE
        {
            get { return Fechadesde; }
            set { Fechadesde = value; }
        }

        public DateTime FECHAHASTA
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

        public ENHipoteca()
        {
            ID = 0;
            FECHADESDE = DateTime.MinValue;
            FECHAHASTA = DateTime.MaxValue;
            INTERESES = 0;
            NUMSOLICITUDES = 0;
            BANCO = "";
        }

        public ENHipoteca(int id,DateTime Fechadesde,DateTime Fechahasta,float intereses,int numSolicitudes,string banco)
        {
            ID = id;
            FECHADESDE = Fechadesde;
            FECHAHASTA = Fechahasta;
            INTERESES = intereses;
            NUMSOLICITUDES = numSolicitudes;
            BANCO = banco;
        }
    }
}
