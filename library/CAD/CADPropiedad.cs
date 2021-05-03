using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADPropiedad
    {

        private string constring;
        public CADPropiedad()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
        }
        public bool createPropiedad(ENPropiedad en, uint id)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            string comando = "Insert INTO [dbo].[Propiedad] (id,numCatastral, superficie, habitaciones, banyos)" +
                "VALUES ('" + id + "', '" + en.numCatastral + "', '" + en.superficie + "', "
                + en.habitaciones + "', " + en.banyos + ")";

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

        public bool readPropiedad(ENPropiedad en, uint id)
        {
            bool read = false;

            return read;
        }
        public bool updatePropiedad(ENPropiedad en, uint id)
        {
            bool update = false;

            return update;
        }
        public bool deletePropiedad(ENPropiedad en, uint id)
        {
            bool deleted = false;

            return deleted;
        }
    }
}
