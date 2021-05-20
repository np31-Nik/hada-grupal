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
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();//Conexion
        }

        public int readUltimoId(ENUsuario en) {
            int auxid = 0;

            string comando = "select MAX(id) From [dbo].[Anuncio] where usuario = '" + en.Nif + "'";
            try{
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                buscar.Read();
                auxid= int.Parse(buscar["id"].ToString());
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
            string comando = "Insert INTO [dbo].[Anuncio] (titulo, precio, usuario, tipo, localidad, descripcion, categoria) " +
                "VALUES ('" + en.titulo + "', " + en.precio + "', " + en.usuario.Nif + "', " + en.tipo + "', " + en.localidad + "', " + en.descripcion + "', " + en.categoria + ")";
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
            bool borrado = false;
            string comando = "DELETE FROM [dbo].[Anuncio] WHERE id = '" + en.id + "'";
            try
            {
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
            string comando = "select * From [dbo].[Anuncio] where id='" + en.id + "'";

            try
            {
                SqlConnection conn = null;
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !encontrado)
                {
                    if (int.Parse(buscar["id"].ToString()) == en.id)
                    {
                        encontrado = true;
                        en.titulo = buscar["titulo"].ToString();
                        en.descripcion = buscar["descripcion"].ToString();
                        en.precio = int.Parse(buscar["precio"].ToString());
                        if (en.categoria == "vehiculo") {
                            en.coche.id = en.id;
                            en.coche.anyo = int.Parse(buscar["ano"].ToString());
                            en.coche.marca = new ENMarcaCoche("",buscar["marca"].ToString(),"");
                            en.coche.tipo = new ENTipoCoche(buscar["tipo"].ToString());
                        }
                        else if (en.categoria=="propiedad")
                        {
                            en.prop.id = en.id;
                            en.prop.superficie= int.Parse(buscar["superficie"].ToString());
                            en.prop.habitaciones = int.Parse(buscar["dorm"].ToString());
                            en.prop.banyos = int.Parse(buscar["bano"].ToString());
                            en.prop.tipo = new ENTipoPropiedad(buscar["tipo"].ToString());
                            en.prop.numCatastral = buscar["numCatastral"].ToString();
                        }
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
            string comando = "UPDATE [dbo].[Anuncio] SET " +
                "titulo= '" + en.titulo + "' ," +
                "precio= '" + en.precio + "' ," +
                "localidad= '" + en.localidad.localidad + "' ," +
                "descripcion= '" + en.descripcion + "' ," +
                "WHERE id = '" + en.id + "'";
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

    }
}
