using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADMarcaCoche

    {

        private string constring;

        public CADMarcaCoche()
        {
              constring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool readMarcaCoche(ENMarcaCoche m)
        {
            bool leer = true;
            string consulta = "Select * from [dbo].[marca]  where marca= "; // falta
            SqlConnection conexion = new SqlConnection(constring);
            try
            {
                conexion.Open();
                SqlCommand ejecuta = new SqlCommand(consulta, conexion);
                SqlDataReader ojear = ejecuta.ExecuteReader();
                ojear.Read();
                /*if ()
                {

                }
                else
                {
                    leer = false;
                }*/
                ojear.Close();
            }
            catch (SqlException e)
            {
                leer = false;
                Console.WriteLine(" Error", e.Message);
            }
            finally
            {
                conexion.Close();
            }
            return leer;
        }



        public bool createMarcaCoche(ENMarcaCoche m)
        {
            bool crear = true;
            SqlConnection conectado = new SqlConnection(constring);
            try
            {
                conectado.Open();
            }
            catch (System.Exception e)
            {
                crear = false;
                Console.WriteLine(" Error !!", e.Message);

            }
            finally
            {
                conectado.Close();
            }
            return crear;
        }


        public bool deleteMarcaCoche(ENMarcaCoche m)
        {
            bool borrar = false;
            SqlConnection conexion = null;
            string consulta = " DELETE FROM  [dbo].[marca] where "; // falta
            try
            {
                conexion = new SqlConnection(constring);
                conexion.Open();
                SqlCommand ejecutar = new SqlCommand(consulta, conexion);
                ejecutar.ExecuteNonQuery();
                borrar = true;
            }
            catch (SqlException e)
            {
                borrar = false;
                Console.WriteLine("Error", e.Message);
            }
            finally
            {
                conexion.Close();
            }
            return borrar;
        }



        public bool updateMarcaCoche(ENMarcaCoche m)
        {
            bool act = false;
            string actualizar = " ";
            SqlConnection conexion = null;
            try
            {
                conexion = new SqlConnection(constring);
                conexion.Open();
                act = true;
            }
            catch (SqlException e)
            {
                actualizar = e.Message;
                Console.WriteLine("Error !!", e.Message);
                act = false;
            }
            catch (Exception e)
            {
                actualizar = e.Message;
                Console.WriteLine("Error !!", e.Message);
                act = false;
            }
            finally
            {
                conexion.Close();
            }

            return act;
        }




        public bool readNextMarcaCoche(ENMarcaCoche m)
        {
            bool read = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string comando = "select * from [dbo].[marca]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                int cont = 0;
                while (lector.Read())
                {
                    if (cont == 1)
                    {
                        break;
                    }
                    else
                        cont++;    
                }
                lector.Close();
                read = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                read = false;
                Console.WriteLine("Error !!", ex.Message);
            }
            catch (Exception ex)
            {
                read = false;
                Console.WriteLine("Error !!", ex.Message);
            }
            return read;
        }



        public bool readFirstMarcaCoche(ENMarcaCoche c)
        {
            bool leer = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[marca]";
                SqlCommand consulta = new SqlCommand(select, conexion);
                SqlDataReader buscar = consulta.ExecuteReader();
                buscar.Read();
                leer = true;
                buscar.Close();
                conexion.Close();
            }
            catch (SqlException e)
            {
                leer = false;
                Console.WriteLine("Error !!", e.Message);
            }
            catch (Exception e)
            {
                leer = false;
                Console.WriteLine("Error!!", e.Message);
            }
            return leer;

        }
    }
}
