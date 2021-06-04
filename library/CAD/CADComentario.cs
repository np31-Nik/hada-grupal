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
    public class CADComentario
    {
        private string constring;

        public CADComentario()
        {
            constring = constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();
        }

        public bool readComentario(ENComentario en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[Comentario] where id='" + en.id + "'", connection);

                SqlDataReader read = cmd.ExecuteReader();
                read.Read();

                if (int.Parse(read["id"].ToString()) == en.id)
                {
                    en.text = read["coment"].ToString();
                    en.fecha = DateTime.Parse(read["fecha"].ToString());
                    en.user = read["usuario"].ToString();
                    en.anuncio = int.Parse(read["anuncio"].ToString());
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

        public bool createComentario(ENComentario en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Insert into [dbo].[Comentario](coment,usuario,anuncio) VALUES ('" + en.text + "','"+ en.user + "','" + en.anuncio + "')", connection);

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

        public bool deleteComentario(ENComentario en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Comentario] WHERE id='" + en.id + "'", connection);

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

        public bool updateComentario(ENComentario en, string text)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Comentario] SET coment='" + text + "' WHERE id='" + en.id + "'", connection);

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

        public bool readNextComentario(ENComentario en)
        {
            bool success = false;
            bool located = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[Comentario]", connection);

                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read() && !success)
                {
                    if (located)
                    {
                        en.text = read["coment"].ToString();
                        en.fecha = DateTime.Parse(read["fecha"].ToString());
                        en.anuncio = int.Parse(read["anuncio"].ToString());
                        en.user = read["usuario"].ToString();
                        success = true;
                    }
                    if (int.Parse(read["id"].ToString()) == en.id)
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

        public bool readFirstComentario(ENComentario en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Select * from [dbo].[Comentario]", connection);

                SqlDataReader read = cmd.ExecuteReader();
                read.Read();

                en.id = int.Parse(read["id"].ToString());
                en.text = read["coment"].ToString();
                en.user = read["usuario"].ToString();
                en.anuncio = int.Parse(read["anuncio"].ToString());
                en.fecha = DateTime.Parse(read["fecha"].ToString());
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

        public DataSet BuscarComentarios(string anuncio, ref bool success)
        {
            success = false;
            DataSet ds = new DataSet();
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();
                string query = "select * from [dbo].[Comentario], [dbo].[Usuario] WHERE anuncio='"+anuncio+"' AND Comentario.usuario = Usuario.nif";

                SqlDataAdapter adp = new SqlDataAdapter(query, constring);

                adp.Fill(ds);

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
            return ds;
        
        }
    }
}
