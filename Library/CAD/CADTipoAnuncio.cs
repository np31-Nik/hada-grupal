using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace library
{
    class CADTipoAnuncio
    {
        private string constring;
        private bool modifComandExec(string comando)
        {
            SqlConnection c = null;
            try
            {
                c = new SqlConnection(constring);
                c.Open();
                SqlCommand com = new SqlCommand(comando, c);
                com.ExecuteNonQuery();
                c.Close();
                return true;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (c != null) c.Close();
            }
        }
        private bool obtainComandExec(string comando, ENTipoAnuncio en)
        {
            SqlConnection c = null;
            try
            {
                c = new SqlConnection(constring);
                c.Open();
                SqlCommand com = new SqlCommand(comando, c);
                SqlDataReader dr = com.ExecuteReader();

                dr.Read();

                //en. = dr[""].ToString();

                dr.Close();
                c.Close();
                return true;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (c != null) c.Close();
            }
        }

        public CADTipoAnuncio()
        {
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();
        }

        public bool createTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Insert Into __ () VALUES()";
            return modifComandExec(comando);
        }
        public bool updateTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Update  set  where nif=";
            return modifComandExec(comando);
        }
        public bool deleteTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Delete from where ";
            return modifComandExec(comando);
        }
        public bool readTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Select __ from ";
            return obtainComandExec(comando, en);
        }

        /*
        public bool readFirstTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Select __ from  ";
            return obtainComandExec(comando, en);
        }

        public bool readNextTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Select __ from  ";
            return obtainComandExec(comando, en);
        }

        public bool readPrevTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Select __ from ";
            return obtainComandExec(comando, en);
        }*/


    }
}
