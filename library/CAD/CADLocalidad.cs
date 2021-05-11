using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    public class CADLocalidad
    {
        private string constring;
        public CADLocalidad()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
        }
        public bool createLocalidad(ENLocalidad en)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            string comando = "Insert INTO [dbo].[Localidad] (Localidad)" +
                "VALUES ('"+ en.localidad  + ")";

            try
            {
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                cmd.ExecuteNonQuery();
                creado = true;

                conn.Close();
            }
            catch (SqlException e)
            {

            }
            catch (Exception e)
            {

            }
            return creado;
        }

        public bool readLocalidad(ENLocalidad en)
        {
            bool read = false;

            return read;
        }
        public bool updateLocalidad(ENLocalidad en)
        {
            bool update = false;

            return update;
        }
        public bool deleteLocalidad(ENLocalidad en)
        {
            bool deleted = false;

            return deleted;
        }
        public bool readNextLocalidad(ENLocalidad en)
        {
            bool read = false;

            return read;
        }
    }
}

