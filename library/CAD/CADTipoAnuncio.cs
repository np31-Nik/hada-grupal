using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADTipoAnuncio
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

                en.Tipo = dr["tipo"].ToString();

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
            string comando = "Insert Into TipoAnuncio (tipo) VALUES('"+en.Tipo+"')";
            return modifComandExec(comando);
        }
        public bool updateTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Update TipoAnuncio set tipo='" + en.NewTipo + "' where tipo='" + en.Tipo + "'";
            return modifComandExec(comando);
        }
        public bool deleteTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Delete from TipoAnuncio where tipo='" + en.Tipo + "'";
            return modifComandExec(comando);
        }
        public bool readTipoAnuncio(ENTipoAnuncio en)
        {
            string comando = "Select tipo from TipoAnuncio where tipo='" + en.Tipo + "'";
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
