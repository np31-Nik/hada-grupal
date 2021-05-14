using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using System.Configuration;

namespace library
{
    public class CADTipoPropiedad
    {
        private string constring;

        public CADTipoPropiedad()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;

            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Insert into [dbo].[TipoPropiedad](tipo) VALUES ('" + en.tipo + "')", connection);

                cmd.ExecuteNonQuery();
                success = true;
                connection.Close();

            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }

            return success;
        }

        public bool readTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[TipoPropiedad] where tipo='" + en.tipo + "'", connection);

                SqlDataReader read = cmd.ExecuteReader();
                read.Read();

                if (read["tipo"].ToString() == en.tipo)
                {
                    success = true;
                }
                read.Close();
                connection.Close();

            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }
            return success;
        }

        public bool deleteTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[TipoPropiedad] WHERE tipo='" + en.tipo + "'", connection);

                cmd.ExecuteNonQuery();
                connection.Close();
                success = true;
            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }

            return success;
        }

        public bool updateTipoPropiedad(ENTipoPropiedad en, string T)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("UPDATE [dbo].[TipoPropiedad] SET tipo='" + T + "' WHERE tipo='" + en.tipo + "'", connection);

                cmd.ExecuteNonQuery();
                connection.Close();
                success = true;
            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }

            return success;
        }

        public bool readNextTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;
            bool located = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[TipoPropiedad]", connection);

                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read() && !success)
                {
                    if (located)
                    {
                        en.tipo = read["tipo"].ToString();
                        success = true;
                    }
                    if (read["tipo"].ToString() == en.tipo)
                    {
                        located = true;
                    }
                }

                read.Close();
                connection.Close();

            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }
            return success;
        }

        public bool readFirstTipoPropiedad(ENTipoPropiedad en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[TipoPropiedad]", connection);

                SqlDataReader read = cmd.ExecuteReader();
                read.Read();

                en.tipo = read["tipo"].ToString();
                success = true;

                read.Close();
                connection.Close();

            }
            catch (SqlException sqlex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", sqlex.Message);

            }
            catch (Exception ex)
            {
                success = false;
                Console.WriteLine("User operation has failed. Error: {0}", ex.Message);
            }
            return success;
        }
    }
}
