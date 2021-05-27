using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace library
{
    public class CADAnuncio
    {
        private string constring;
        public CADAnuncio()
        {
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();//Conexion
        }

        public int readUltimoId(ENUsuario en) {
            int auxid = 0;

            
            try{
                string comando = "select id From [dbo].[Anuncio] where usuario = '" + en.Nif + "'";
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read())
                {
                    if((int)buscar["id"]>auxid)
                        auxid = int.Parse(buscar["id"].ToString());
                }
                buscar.Close();
                conn.Close();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }

            return auxid;
        }

        public bool createAnuncio(ENAnuncio en)
        {
            bool creado = false;
            
            try
            {
                string comando = "Insert INTO [dbo].[Anuncio] (titulo, precio, usuario, tipo, localidad, descripcion, categoria) " +
                "VALUES ('" + en.titulo + "', '" + en.precio + "', '" + en.usuario.Nif + "', '" + en.tipo.Tipo + "', '" + en.localidad.localidad +
                "', '" + en.descripcion + "', '" + en.categoria + "')";
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
            bool borrado = false;
            
            try
            {
                string comando = "DELETE FROM [dbo].[Anuncio] WHERE id = '" + en.id + "'";
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
        public bool readAnuncio(ENAnuncio en)
        {

            bool encontrado = false;
           

            try
            {
                string comando = "select * From [dbo].[Anuncio] where id='" + en.id + "'";
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !encontrado)
                {

                        encontrado = true;
                    en.tipo.Tipo = buscar["tipo"].ToString();
                        en.titulo = buscar["titulo"].ToString();
                        en.usuario.Nif = buscar["usuario"].ToString();
                        en.descripcion = buscar["descripcion"].ToString();
                        en.precio = int.Parse(buscar["precio"].ToString());
                        en.categoria = buscar["categoria"].ToString();
                    en.localidad.localidad = buscar["localidad"].ToString();
                        if (en.categoria == "coche") {
                            en.coche.id = en.id;
                            en.coche.anyo = int.Parse(buscar["ano"].ToString());
                            en.coche.marca.tipo = buscar["marca"].ToString();
                            en.coche.tipo.categoria = buscar["tipo"].ToString();
                        }
                        else if (en.categoria=="propiedad")
                        {
                            en.prop.id = en.id;
                            en.prop.superficie= int.Parse(buscar["superficie"].ToString());
                            en.prop.habitaciones = int.Parse(buscar["dorm"].ToString());
                            en.prop.banyos = int.Parse(buscar["bano"].ToString());
                            en.prop.tipo.tipo = buscar["tipo"].ToString();
                            en.prop.numCatastral = buscar["numCatastral"].ToString();
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
            
            try
            {
                string comando = "UPDATE [dbo].[Anuncio] SET " +
                "titulo= '" + en.titulo + "' ," +
                "precio= '" + en.precio + "' ," +
                "localidad= '" + en.localidad.localidad + "' ," +
                "descripcion= '" + en.descripcion + "' ," +
                "WHERE id = '" + en.id + "'";
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
        public DataSet BusquedaAnuncios(string cmd_a, string cmd_b, string tabla, ref bool success)
        {
            success = false;
            DataSet ds = new DataSet();
            try
            {
                SqlConnection connection = null;
                connection = new SqlConnection(constring);
                connection.Open();
                string query = "select * from [dbo].[Anuncio], [dbo].[Foto], [dbo].[" + tabla +"] " +
                    "WHERE [dbo].[Anuncio].id=[dbo].[" + tabla + "].anuncio " +
                    "AND [dbo].[Anuncio].id IN (select id from [dbo].[Anuncio] " + cmd_a + ")" +
                    " AND [dbo].[" + tabla + "].anuncio IN (select anuncio from [dbo].[" + tabla + "] " + cmd_b + ")"+
                    " AND [dbo].[Foto].anuncio = [dbo].[Anuncio].id";

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
