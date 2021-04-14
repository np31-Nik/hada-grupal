using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class ENUsuario
    {
        /// <summary>
        /// Guarda este usuario en la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool createUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.createUsuario(this);
        }
        /// <summary>
        /// Recupera el usuario indicado de la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.readUsuario(this);
        }
        /// <summary>
        /// Recupera todos los usuarios de la BD y devuelve solo el primer usuario
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readFirstUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.readFirstUsuario(this);
        }
        /// <summary>
        /// Recupera todos los usuarios de la BD y devuelve solo el usuario siguiente al indicado.
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readNextUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.readNextUsuario(this);
        }
        /// <summary>
        /// Recupera todos los usuarios de la BD y devuelve solo el usuario anterior al indicado
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool readPrevUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.readPrevUsuario(this);
        }
        /// <summary>
        /// Actualiza este usuario en la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool updateUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.updateUsuario(this);
        }
        /// <summary>
        /// Borra este usuario de la BD
        /// </summary>
        /// <returns>False si no se ha podido realizar la operación</returns>
        public bool deleteUsuario()
        {
            CADUsuario db = new CADUsuario();
            return db.deleteUsuario(this);
        }
    }
}
