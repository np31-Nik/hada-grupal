namespace library
{
    public class ENMarcaCoche
    {
        private string logo;
        private string nombre;
        private string distincion;

        public string companyia
        {
            get { return logo; }
            set { logo = value; }
        }


        public string tipo
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string matricula
        {
            get { return distincion; }
            set { distincion = value; }
        }

        public ENMarcaCoche()
        {
            CADMarcaCoche cad = new CADMarcaCoche();
            companyia = " ";
            tipo = " ";
            matricula = " ";
        }

        public ENMarcaCoche(string company, string tipe, string numero)
        {
            companyia = company;
            tipo = tipe;
            matricula = numero;
        }

        public ENMarcaCoche(ENMarcaCoche marca)
        {
            this.companyia = marca.companyia;
            this.tipo = marca.tipo;
            this.matricula = marca.matricula;
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
            if (aux.readMarcaCoche(this))
            {
                actualizar = aux.updateMarcaCoche(this);
            }
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

