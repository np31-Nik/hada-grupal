using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADFoto
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
        private bool obtainComandExec(string comando, ENFoto en)
        {
            SqlConnection c = null;
            try
            {
                c = new SqlConnection(constring);
                c.Open();
                SqlCommand com = new SqlCommand(comando, c);
                SqlDataReader dr = com.ExecuteReader();

                dr.Read();

                en.ID = int.Parse(dr["id"].ToString());
                en.Foto = (byte[])dr["foto"];

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

        public CADFoto()
        {
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();
        }

        public bool createFoto(ENFoto en)
        {
            string comando = "Insert Into Foto (anuncio,foto) VALUES('" + en.Anuncio.id + "','" + en.Foto + "')";
            return modifComandExec(comando);
        }
        public bool updateFoto(ENFoto en)
        {
            string comando = "Update Foto set foto='" + en.Foto + "' where id='" + en.ID + "'";
            return modifComandExec(comando);
        }
        public bool deleteFoto(ENFoto en)
        {
            string comando = "Delete from Foto where id='" + en.ID + "'";
            return modifComandExec(comando);
        }
        public bool readFirstFoto(ENFoto en)
        {
            string comando = "Select id, foto from Foto where id=(select min(id) from Foto where anuncio='" + en.Anuncio.id + "')";
            return obtainComandExec(comando, en);
        }

        public bool readNextFoto(ENFoto en)
        {
            string comando = "Select id, foto from Foto where id=min(select id from Foto where id>'"+en.ID+ "' and anuncio='" + en.Anuncio.id + "')";
            return obtainComandExec(comando, en);
        }

        public bool readPrevFoto(ENFoto en)
        {
            string comando = "Select id, foto from Foto where id=max(select id from Foto where id<'" + en.ID + "' and anuncio='" + en.Anuncio.id + "')";
            return obtainComandExec(comando, en);
        }
        /*
       public bool readFoto(ENFoto en)
       {
           string comando = "Select foto from Foto where id=";
           return obtainComandExec(comando, en);
       }
       */
    }
}
