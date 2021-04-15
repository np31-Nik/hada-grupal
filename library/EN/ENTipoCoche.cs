using library.CAD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library.EN
{
    class ENTipoCoche
    {
        private string tipo_vehiculo;

        public string categoria
        {
            get { return tipo_vehiculo; }
            set { tipo_vehiculo = value; }
        }

        public ENTipoCoche()
        {
            categoria = " ";
        }

        public ENTipoCoche(string modelo)
        {
            categoria = modelo;
        }

        public ENTipoCoche(ENTipoCoche t)
        {
            this.categoria = t.categoria;
        }

        public bool readTipoCoche()
        {
            CADTipoCoche aux = new CADTipoCoche();
            bool leer = aux.readTipoCoche(this);
            return leer;
        }

        public bool createTipoCoche()
        {
            bool leer = false;
            CADTipoCoche cad = new CADTipoCoche();
            if (!(cad.readTipoCoche(this)))
            {
                leer = cad.createTipoCoche(this);
            }
            return leer;
        }

        public bool deleteTipoCoche()
        {
            bool borrar = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readTipoCoche(this)))
            {
                borrar = aux.deleteTipoCoche(this);
            }
            return borrar;
        }

        public bool updateTipoCoche(string apariencia)
        {
            bool editar = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readTipoCoche(this)))
            {
                editar = aux.updateTipoCoche(this, apariencia);
            }
            return editar;
        }

        public bool readNextTipoPropiedad(ENTipoCoche en)
        {
            bool siguiente = false;
            CADTipoCoche aux = new CADTipoCoche();
            if (!(aux.readTipoCoche(this)))
            {
                siguiente = aux.readNextTipoCoche(this);
            }
            return siguiente;
        }

        public bool readFirstTipoCoche(ENTipoCoche en)
        {
            CADTipoCoche auxiliar = new CADTipoCoche();
            bool leer = auxiliar.readFirstTipoCoche(this);
            return leer;
        }






    }
}
