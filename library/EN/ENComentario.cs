﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class ENComentario
    {
        private int _id;
        private string _text;
        private DateTime _fecha;
        private string _user;
        private int _anuncio;

        public int id { 
            get { return _id; } 
            set { _id = value; } 
        }

        public string text { 
            get { return _text; } 
            set { _text = value; } 
        }

        public DateTime fecha { 
            get { return _fecha; } 
            set { _fecha = value; } 
        }

        public string user
        {
            get { return _user; }
            set { _user = value; }
        }

        public int anuncio
        {
            get { return _anuncio; }
            set { _anuncio = value; }
        }

        public ENComentario()
        {
            CADComentario cad = new CADComentario();
            id = cad.getId();
            text = "";
            fecha = DateTime.Today;
            user = "";
            anuncio = -1;
        }

        public ENComentario(int n_id,string n_text, DateTime n_fecha,string n_user, int n_anuncio){
            id = n_id;
            text = n_text;
            fecha = n_fecha;
            user = n_user;
            anuncio = n_anuncio;
        }

        public ENComentario(ENComentario c)
        {
            this.id = c.id;
            this.text = c.text;
            this.fecha = c.fecha;
            this.user = c.user;
            this.anuncio = c.anuncio;
        }

        public bool readComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = cad.readComentario(this);
            return success;
        }

        public bool createComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = cad.createComentario(this);
            return success;
        }

        public bool deleteComentario()
        {
            bool success = false;
            CADComentario cad = new CADComentario();
            if (cad.readComentario(this))
            {
                success = cad.deleteComentario(this);
            }
            return success;
        }

        public bool editComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = false;
            if (cad.readComentario(this))
            {
                success = cad.editComentario(this);
            }
            return success;
        }
        
        public bool readNextComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = false;
            if (cad.readComentario(this))
            {
                success = cad.readNextComentario(this);
            }
            return success;
        }

        public bool readFirstComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = cad.readFirstComentario(this);
            return success;
        }

        public bool readLastComentario()
        {
            CADComentario cad = new CADComentario();
            bool success = cad.readLastComentario(this);
            return success;
        }
    }
}