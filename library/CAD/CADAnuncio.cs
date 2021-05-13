using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADAnuncio
    {
        private string constring;
        public CADAnuncio()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString();//Conexion
        }

        public bool createAnuncio(ENAnuncio en, uint id)
        {
            bool creado = false;
            string comando = "Insert INTO [dbo].[Anuncio] (id, titulo, precio, usuario, tipo, localidad, descripcion) " +
                "VALUES ('" + en.id + "', '" + en.titulo + "', " + en.precio + "', " + en.usuario.Nif + "', " + en.tipo + "', " + en.localidad + "', " + en.descripcion + ")";
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
            catch (SqlException ex)
            {
                creado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                creado = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }

            return creado;
        }
        public bool deleteAnuncio(ENAnuncio en)
        {
            bool deleted = false;


            return deleted;
        }
        public bool readAnuncio(ENAnuncio en)
        {
            bool read = false;


            return read;
        }
        public bool readFirstAnuncio(ENAnuncio en)
        {
            bool updated = false;


            return updated;
        }
        public bool readNextAnuncio(ENAnuncio en)
        {
            bool updated = false;


            return updated;
        }
        public bool updateAnuncio(ENAnuncio en)
        {
            bool updated = false;


            return updated;
        }

    }
}
