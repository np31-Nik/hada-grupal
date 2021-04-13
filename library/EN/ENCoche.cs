using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENCoche
    {
        
        private string  _tipo, _subTipo, _marca = null, _direccion;
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
        
        
        public ENCoche(int year, string type, string subType, string marcaParam)
        {
            tipo = type;
            marca = marcaParam;
            anyo = year;

        }
        public bool crearCoche(ENAnuncio anuncio,ref int id)
        {
            CADCoche coche= new CADCoche();
            if (coche.crearCoche(this, anuncio.id))
            {
                id++;
                return true;
            }
            return false;
        }
    }
}
