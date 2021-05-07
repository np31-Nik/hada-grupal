using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENLocalidad
    {
        private string _localidad;

        public string localidad
        {
            get { return _localidad; }
            set { _localidad = value; }
        }

        public ENLocalidad() {
            localidad = "";
        }
        public bool readLocalidad()
        {
            CADLocalidad aux = new CADLocalidad();
            bool leer = aux.readLocalidad(this);
            return leer;
        }

        public bool createLocalidad()
        {
            bool leer = false;
            CADLocalidad cad = new CADLocalidad();
            if (!(cad.createLocalidad(this)))
            {
                leer = cad.createLocalidad(this);
            }
            return leer;
        }

        public bool deleteLocalidad()
        {
            bool borrar = false;
            CADLocalidad aux = new CADLocalidad();
            if (!(aux.readLocalidad(this)))
            {
                borrar = aux.deleteLocalidad(this);
            }
            return borrar;
        }

        public bool updateLocalidad(string apariencia)
        {
            bool editar = false;
            CADLocalidad aux = new CADLocalidad();
            if (!(aux.readLocalidad(this)))
            {
                editar = aux.updateLocalidad(this);
            }
            return editar;
        }

        public bool readNextLocalidad(ENTipoCoche en)
        {
            bool siguiente = false;
            CADLocalidad aux = new CADLocalidad();
            if (!(aux.readLocalidad(this)))
            {
                siguiente = aux.readNextLocalidad(this);
            }
            return siguiente;
        }
    }
}
