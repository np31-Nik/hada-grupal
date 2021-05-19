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
            bool encontrado = false;
            string comando = "select * From [dbo].[Localidad] where localidad='" + en.localidad + "'";

            try
            {
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !encontrado)
                {
                    if (buscar["localidad"].ToString() == en.localidad)
                    {
                        en.localidad = buscar["localidad"].ToString();
                        encontrado = true;
                    }
                }
                buscar.Close();
                conn.Close();

            }
            catch (SqlException ex)
            {
                encontrado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                encontrado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);

            }

            return encontrado;
        }
        public bool updateLocalidad(ENLocalidad en)
        {
            bool updated = false;
            string comando = "UPDATE [dbo].[Localidad] SET " +
                "localidad= '" + en.newLocalidad+ "' ," +
                "WHERE localidad = '" + en.localidad + "'";
            try
            {
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
        public bool deleteLocalidad(ENLocalidad en)
        {
            bool deleted = false;
            string comando = "DELETE FROM [dbo].[Localidad] WHERE nif = '" + en.localidad + "'";
            try
            {
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                deleted = true;
            }
            catch (SqlException ex)
            {
                deleted = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                deleted = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }



            return deleted;
        }
        public bool readNextLocalidad(ENLocalidad en)
        {
            bool read = false;

            return read;
        }
    }
}

