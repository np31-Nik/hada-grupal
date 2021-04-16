using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class CADCoche
    {
        private string constring;
        public CADCoche()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
        }
        public bool createCoche(ENCoche en,uint id)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            string comando ="Insert INTO [dbo].[Coche] (id,anyo) "+
                "VALUES ('" + id + "', '" + en.anyo + ")";

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

        public bool readCoche(ENCoche en,uint id)
        {
            bool read = false;

            return read;
        }
        public bool updateCoche(ENCoche en,uint id)
        {
            bool update = false;

            return update;
        }
        public bool deleteCoche(ENCoche en, uint id)
        {
            bool deleted = false;

            return deleted;
        }

    }
}
