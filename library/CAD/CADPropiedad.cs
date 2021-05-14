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
            string comando = "Insert INTO [dbo].[Propiedad] (id,numCatastral, superficie, dorm, bano, tipo)" +
                "VALUES ('" + id + "', '" + en.numCatastral + "', '" + en.superficie + "', "
                + en.habitaciones + "', " + en.banyos + "', " + en.tipo + ")";

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
            string comando = "select * From [dbo].[Propiedad] where anuncio='" + id + "'";

            try
            {
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !read)
                {
                    if (buscar["id"].ToString() == id.ToString())
                    {
                        
                        id = (uint)int.Parse(buscar["id"].ToString());
                        en.numCatastral = buscar["numCatastral"].ToString();
                        en.superficie = int.Parse(buscar["superficie"].ToString());
                        en.tipo = (ENTipoPropiedad)buscar["tipo"];
                        en.banyos = int.Parse(buscar["bano"].ToString());
                        en.habitaciones = int.Parse(buscar["dorm"].ToString());
                    }
                }
                buscar.Close();
                conn.Close();
                read = true;

            }
            catch (SqlException ex)
            {
                read = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                read = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);

            }
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
