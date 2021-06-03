namespace library
{
    public class ENMarcaCoche
    {
        private string marca;
        

        public string companyia
        {
            get { return marca; }
            set { marca = value; }
        }


        private string _newTipo;
        public string NewTipo
        {
            get { return _newTipo; }
            set { _newTipo = value; }
        }



        public ENMarcaCoche()
        {
            CADMarcaCoche cad = new CADMarcaCoche();
            companyia = " ";
           
        }

        
        public ENMarcaCoche(string marca)
        {
            this.companyia = marca;
           
        }

        public bool readMarcaCoche()
        {
            CADMarcaCoche aux = new CADMarcaCoche();
            bool leer = aux.readMarcaCoche(this);
            return leer;
        }

        public bool createMarcaCoche()
        {
            CADMarcaCoche aux = new CADMarcaCoche();
            bool crear = aux.createMarcaCoche(this);
            return crear;
        }

        public bool deleteMarcaCoche()
        {
            bool borrar = false;
            CADMarcaCoche aux = new CADMarcaCoche();
            if (aux.readMarcaCoche(this))
            {
                borrar = aux.deleteMarcaCoche(this);
            }
            return borrar;
        }

        public bool updateMarcaCoche()
        {
            CADMarcaCoche aux = new CADMarcaCoche();
            bool actualizar = false;

                actualizar = aux.updateMarcaCoche(this);
            
            return actualizar;
        }

        public bool readNextMarcaCoche()
        {
            CADMarcaCoche aux = new CADMarcaCoche();
            bool leer = false;
            if (aux.readMarcaCoche(this))
            {
                leer = aux.readNextMarcaCoche(this);
            }
            return leer;
        }

        public bool readFirstMarcaCoche()
        {
            CADMarcaCoche aux = new CADMarcaCoche();
            bool leer = aux.readFirstMarcaCoche(this);
            return leer;
        }

    }
}

