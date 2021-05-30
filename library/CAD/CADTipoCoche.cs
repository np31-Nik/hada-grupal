using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADTipoCoche
    {
        private string constring;


        public CADTipoCoche()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createTipoCoche(ENTipoCoche en)
        {
            bool crear = true;

            SqlConnection conectado = null;
            try
            {

                conectado = new SqlConnection(constring);
                conectado.Open();
                string select = "Insert into [dbo].[TipoCoche] (tipo) VALUES ('" + en.categoria + ")";
                SqlCommand consulta = new SqlCommand(select, conectado);
                consulta.ExecuteNonQuery();
                crear = true;
                conectado.Close();



            }
            catch (System.Exception e)
            {
                crear = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);


            }
            finally
            {
                conectado.Close();
            }
            return crear;
        }



        public bool readTipoCoche(ENTipoCoche en)
        {
            bool lectura = false;
            try
            {

                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[TipoCoche] Where categoria = '" + en.categoria + "' ";
                SqlCommand consulta = new SqlCommand(select, conexion);
                SqlDataReader buscar = consulta.ExecuteReader();
                buscar.Read();
                if (buscar["tipo"].ToString() == en.categoria)
                {
                    en.categoria = buscar["tipo"].ToString();

                    lectura = true;
                }
                buscar.Close();
                conexion.Close();

            }
            catch (SqlException e)
            {
                lectura = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);

            }
            catch (Exception e)
            {
                lectura = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }

            return lectura;
        }

        public bool deleteTipoCoche(ENTipoCoche en)
        {

            bool borrado = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Delete from [dbo].[TipoCoche] wHERE categoria = '" + en.categoria + "'";
                SqlCommand consulta = new SqlCommand(select, conexion);
                consulta.ExecuteNonQuery();
                borrado = true;
                conexion.Close();
            }
            catch (SqlException e)
            {
                borrado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            catch (Exception e)
            {
                borrado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            return borrado;

        }

        public bool updateTipoCoche(ENTipoCoche en, string apariencia)
        {
            bool actualizado = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "update [dbo].[TipoCoche] SET nombre= '" + en.categoria + "";
                SqlCommand consulta = new SqlCommand(select, conexion);
                consulta.ExecuteNonQuery();
                actualizado = true;
                conexion.Close();
            }
            catch (SqlException e)
            {
                actualizado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            catch (Exception e)
            {
                actualizado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            return actualizado;

        }

        public bool readNextTipoCoche(ENTipoCoche en)
        {

            bool read = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();

                string comando = "select * from [dbo].[TipoCoche]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                string TipoCoche = en.categoria;
                int cont = 0;

                while (lector.Read())
                {
                    en.categoria = lector["TioCoche"].ToString();
                    if (cont == 1)
                    {
                        break;
                    }
                    if (lector["TipoCoche"].ToString() == TipoCoche)
                    {
                        cont++;
                    }
                }

                lector.Close();
                read = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                read = false;
                Console.WriteLine("User operation has failed.Error: {0}", ex.Message);

            }
            catch (Exception ex)
            {
                read = false;
                Console.WriteLine("User operation has failed.Error: {0}", ex.Message);
            }

            return read;


        }

        public bool readFirstTipoCoche(ENTipoCoche en)
        {
           
            bool leer = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[TipoCoche]";
                SqlCommand consulta = new SqlCommand(select, conexion);
                SqlDataReader buscar = consulta.ExecuteReader();
                buscar.Read();
                
                en.categoria = buscar["categoria"].ToString();
                while (buscar.Read() && !leer)
                {
                    if (buscar["TipoCoche"].ToString() == en.categoria)
                    {
                        leer = true;
                    }
                    en.categoria = buscar["TipoCoche"].ToString();

                }
               
                buscar.Close();
                conexion.Close();
            }
            catch (SqlException e)
            {
                leer = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            catch (Exception e)
            {
                leer = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            return leer;
        }
    }    
}
