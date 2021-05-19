namespace library
{
    public class ENCoche
    {
        private ENMarcaCoche _marca;
        private ENTipoCoche _tipo;
        private int _anyo;
        private int _id;


        public int id
        {
            get { return (int)_id; }
            set { _id = value; }
        }
        public ENTipoCoche tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        public ENMarcaCoche marca
        {
            get { return _marca; }
            set { _marca = value; }
        }


        public int anyo
        {
            get { return _anyo; }
            set { _anyo = value; }
        }


        public ENCoche()
        {
            tipo = new ENTipoCoche();
            marca = new ENMarcaCoche();
            anyo = 0;

        }
        public ENCoche(int year, ENTipoCoche type, ENMarcaCoche marcaParam)
        {
            tipo = type;
            marca = marcaParam;
            anyo = year;

        }
        public bool createCoche(ENCoche coche,int idParam)
        {
            CADCoche CadCoche = new CADCoche();
            coche.id = idParam;
            if (CadCoche.createCoche(coche))
            {
                return true;
            }
            return false;
        }
        public bool readCoche(int id)
        {
            this.id = id;
            CADCoche coche = new CADCoche();
            return coche.readCoche(this);
        }
        /*public bool deleteCoche(uint id)
        {
            CADCoche coche = new CADCoche();
            if(readCoche(id))
                return coche.deleteCoche(this);
            return false;
        }*/
        public bool updateCoche(ENCoche en)
        {
            CADCoche coche = new CADCoche();
            if (readCoche(en.id)) 
                return coche.updateCoche(this);
            return false;

        }
    }
}
