﻿namespace library
{
    public class ENUsuario
    {
        private string _nif;
        private string _nombre;
        private string _apellido;
        private string _email;
        private string _contrasenya;
        private bool _premium;
        private bool _admin;
        private int _telefono;

        public string Nif
        {
            get { return _nif; }
            set { _nif = value; }
        }
        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        public string Apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string Contrasenya
        {
            private get { return _contrasenya; }
            set { _contrasenya = value; }
        }
        public bool Premium
        {
            get { return _premium; }
            set { _premium = value; }
        }
        public bool Admin
        {
            get { return _admin; }
            set { _admin = value; }
        }
        public int Telefono
        {
            get { return _telefono; }
            set { _telefono = value; }
        }

        public ENUsuario()
        {
            Nif = "";
            Nombre = "";
            Apellido = "";
            Email = "";
            Contrasenya = "";
            Premium = false;
            Admin = false;
            Telefono = 0;
        }
        public ENUsuario(string nif, string nombre, string apellido, string email, string contrasenya, bool premium, bool admin, int telefono)
        {
            Nif = nif;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Contrasenya = contrasenya;
            Premium = premium;
            Admin = admin;
            Telefono = telefono;
        }

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