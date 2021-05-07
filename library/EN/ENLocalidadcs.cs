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
            CADTipoCoche aux = new CADTipoCoche();
            bool leer = aux.readLocalidad(this);
            return leer;
        }

        public bool createLocalidad()
        {
            bool leer = false;
            CADTipoCoche cad = new CADTipoCoche();
            if (!(cad.createLocalidad(this)))
            {
                leer = cad.createLocalidad(this);
            }
            return leer;
        }

        public bool deleteLocalidad()
        {
            bool borrar = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readLocalidad(this)))
            {
                borrar = aux.deleteLocalidad(this);
            }
            return borrar;
        }

        public bool updateLocalidad(string apariencia)
        {
            bool editar = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readLocalidad(this)))
            {
                editar = aux.updateLocalidad(this, apariencia);
            }
            return editar;
        }

        public bool readNextLocalidad(ENTipoCoche en)
        {
            bool siguiente = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readTipoCoche(this)))
            {
                siguiente = aux.readNextTipoCoche(this);
            }
            return siguiente;
        }
    }
}
