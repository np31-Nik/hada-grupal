using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENCoche
    {

        private string _tipo, _subTipo, _marca = null, _direccion;
        private int _anyo;

        public string tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

        public string marca
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
            tipo = "";
            marca = "";
            anyo = 0;

        }
        public ENCoche(int year, string type, string subType, string marcaParam)
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
        public bool readCoche()
        {
            CADCoche coche = new CADCoche();
            return coche.readCoche(this);
        }
        public bool deletCoche()
        {
            CADCoche coche = new CADCoche();
            return coche.deleteCoche(this);
        }
        public bool updateCoche()
        {
            CADCoche coche = new CADCoche();
            return coche.updateCoche(this);


        }
    }
}
