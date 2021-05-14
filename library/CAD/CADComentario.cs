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
            constring = constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public int getNewId()
        {
            int id = 0;

            return id;
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
                    SqlCommand cmd2 = new SqlCommand("Select * from [dbo].[Ternaria] where comentario='" + en.id + "'", connection);
                    SqlDataReader read2 = cmd2.ExecuteReader();

                    if (int.Parse(read2["comentario"].ToString()) == en.id)
                    {
                        en.text = read["coment"].ToString();
                        en.fecha = DateTime.Parse(read["fecha"].ToString());
                        en.user = read2["usuario"].ToString();
                        en.anuncio = int.Parse(read2["anuncio"].ToString());
                        success = true;
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

        public bool createComentario(ENComentario en)
        {
            bool success = false;
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();

                SqlCommand cmd = new SqlCommand("Insert into [dbo].[Comentario](coment) VALUES ('" + en.text + "')", connection);



                SqlCommand cmd2 = new SqlCommand("Insert into [dbo].[Ternaria](comentario,usuario,anuncio) VALUES ('" + en.id + "','" + en.user + "','" + en.anuncio + "')", connection);

                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
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

                SqlCommand cmd2 = new SqlCommand("DELETE FROM [dbo].[Ternaria] WHERE comentario='" + en.id + "'", connection);
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Comentario] WHERE id='" + en.id + "'", connection);

                cmd2.ExecuteNonQuery();
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

            return success;
        }

        public bool readLastComentario(ENComentario en)
        {
            bool success = false;

            return success;
        }
    }
}
