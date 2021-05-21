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
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString(); ;//Conexion
        }
        public bool createPropiedad(ENPropiedad en)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            

            try
            {
                string comando = "Insert INTO [dbo].[Propiedad] (anuncio, numCatastral, superficie, dorm, bano, tipo)" +
                "VALUES ('" + en.id + "', '" + en.numCatastral + "', '" + en.superficie + "', '"
                + en.habitaciones + "', '" + en.banyos + "', '" + en.tipo.tipo + "')";
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

        public bool readPropiedad(ENPropiedad en)
        {
            bool read = false;
            

            try
            {
                string comando = "select * From [dbo].[Propiedad] where anuncio='" + en.id + "'";
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !read)
                {
                    if (buscar["anuncio"].ToString() == en.id.ToString())
                    {
                        
                        en.id = int.Parse(buscar["anuncio"].ToString());
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
    
        public bool updatePropiedad(ENPropiedad en)
        {
            bool updated = false;
            
            try
            {
                string comando = "UPDATE [dbo].[Propiedad] SET " +
               "tipo= '" + en.tipo + "' ," +
               "dorm= '" + en.habitaciones + "' ," +
               "numCatastral=" + en.numCatastral + "' ," +
               "superficie=" + en.superficie + "' ," +
               "bano=" + en.banyos + "' ," +
               "WHERE anuncio = '" + en.id + "'";
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                updated = true;
            }
            catch (SqlException ex)
            {
                updated = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                updated = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }


            return updated;
        }
        public bool deletePropiedad(ENPropiedad en)
        {
            bool borrado = false;
            
            try
            {
                string comando = "DELETE FROM [dbo].[Propiedad] WHERE anuncio = '" + en.id + "'";
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                borrado = true;
            }
            catch (SqlException ex)
            {
                borrado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                borrado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }

            return borrado;
        }
    }
}
