using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADUsuario
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
        private bool obtainComandExec(string comando, ENUsuario en)
        {
            SqlConnection c = null;
            try
            {
                c = new SqlConnection(constring);
                c.Open();
                SqlCommand com = new SqlCommand(comando, c);
                SqlDataReader dr = com.ExecuteReader();

                dr.Read();

                /*en.Nif = dr["nif"].ToString();
                en.Nombre = dr["nombre"].ToString();
                en.Edad = int.Parse(dr["edad"].ToString());*/

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

        /// <summary>
        /// Inicializa la cadena de conexión de la BD.
        /// </summary>
        public CADUsuario()
        {
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();
        }
        /// <summary>
        /// Crea un nuevo usuario en la BD con los datos del usuario representado por el parámetro en.
        /// </summary>
        public bool createUsuario(ENUsuario en)
        {
            string comando = "Insert Into __ () VALUES()";
            return modifComandExec(comando);
        }
        /// <summary>
        /// Devuelve solo el usuario indicado leído de la BD.
        /// </summary>
        public bool readUsuario(ENUsuario en)
        {
            string comando = "Select __ from ";
            return obtainComandExec(comando, en);
        }
        /// <summary>
        /// Devuelve solo el primer usuario de la BD.
        /// </summary>
        public bool readFirstUsuario(ENUsuario en)
        {
            string comando = "Select __ from  ";
            return obtainComandExec(comando, en);
        }
        /// <summary>
        /// Devuelve solo el usuario siguiente al indicado.
        /// </summary>
        public bool readNextUsuario(ENUsuario en)
        {
            string comando = "Select __ from  ";
            return obtainComandExec(comando, en);
        }
        /// <summary>
        /// Devuelve solo el usuario anterior al indicado.
        /// </summary>
        public bool readPrevUsuario(ENUsuario en)
        {
            string comando = "Select __ from Usuarios where id=max((select id from Usuarios where id>(select id from Usuario where nif=NIF )))";
            return obtainComandExec(comando, en);
        }
        /// <summary>
        /// Actualiza los datos de un usuario en la BD con los datos del usuario representado por el parámetro en.
        /// </summary>
        public bool updateUsuario(ENUsuario en)
        {
            string comando = "Update Usuarios set  where nif=";
            return modifComandExec(comando);
        }
        /// <summary>
        /// Borra el usuario representado en en de la BD.
        /// </summary>
        public bool deleteUsuario(ENUsuario en)
        {
            string comando = "Delete from Usuarios where nif = ";
            return modifComandExec(comando);
        }
    }
}
