namespace library
{
    public class ENCoche
    {
        private ENMarcaCoche _marca;
        private ENTipoCoche _tipo;
        private int _anyo;
        private uint id;

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
        public bool createCoche(uint id)
        {
            CADCoche coche = new CADCoche();
            if (coche.createCoche(this, id))
            {
                return true;
            }
            return false;
        }
        public bool readCoche(uint id)
        {
            CADCoche coche = new CADCoche();
            return coche.readCoche(this, id);
        }
        public bool deleteCoche(uint id)
        {
            CADCoche coche = new CADCoche();
            return coche.deleteCoche(this, id);
        }
        public bool updateCoche(uint id)
        {
            CADCoche coche = new CADCoche();
            return coche.updateCoche(this, id);


        }
    }
}
