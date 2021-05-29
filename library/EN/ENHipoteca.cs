using System;

namespace library
{
    public class ENHipoteca
    {
        private int id;

        private int anyodesde;

        private int anyohasta;

        private int intereses;

        private int numSolicitudes;

        private string banco;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public int FECHADESDE
        {
            get { return anyodesde; }
            set { anyodesde = value; }
        }

        public int FECHAHASTA
        {
            get { return anyohasta; }
            set { anyohasta = value; }
        }

        public int INTERESES
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
            FECHADESDE = 0;
            FECHAHASTA = 0;
            INTERESES = 0;
            NUMSOLICITUDES = 0;
            BANCO = "";
        }

        public ENHipoteca(int id, int anyodesde, int anyohasta, int intereses, int numSolicitudes, string banco)
        {
            ID = id;
            FECHADESDE = anyodesde;
            FECHAHASTA = anyohasta;
            INTERESES = intereses;
            NUMSOLICITUDES = numSolicitudes;
            BANCO = banco;
        }

        public bool createHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool creado = cadh.createHipoteca(this);
            return creado;
        }

        public bool deleteHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool eliminado = cadh.deleteHipoteca(this);
            return eliminado;
        }

        public bool updateHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool act = cadh.updateHipoteca(this);
            return act;
        }

        public bool readHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool leido = cadh.readHipoteca(this);
            return leido;
        }

        public bool readFirstHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool leido = cadh.readFirstHipoteca(this);
            return leido;
        }

        public bool readNextHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool leido = cadh.readNextHipoteca(this);
            return leido;
        }

        public bool readPrevHipoteca()
        {
            CADHipoteca cadh = new CADHipoteca();
            bool leido = cadh.readPrevHipoteca(this);
            return leido;
        }
    }
}
