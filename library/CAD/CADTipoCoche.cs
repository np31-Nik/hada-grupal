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
            SqlConnection conectado = new SqlConnection(constring);
            try
            {
                conectado.Open();
                

            }catch(System.Exception e)
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



        public bool readTipoCoche(ENTipoCoche en)
        {
            bool leer = true;
            string consulta = "Select * from [dbo].[TipoCoche]  where tipo= "; // falta
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
            catch(SqlException e)
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

        public bool deleteTipoCoche(ENTipoCoche en)
        {
            bool borrar = false;
            SqlConnection conexion = null;
            string consulta= " DELETE FROM  [dbo].[tipoCoche] where "; // falta
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

        public bool updateTipoCoche(ENTipoCoche en, string apariencia)
        {
            bool act = false;
            string actualizar=" ";
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

        public bool readNextTipoCoche(ENTipoCoche en)
        {
            bool leer = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[tipoCoche]";
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

        public bool readFirstTipoCoche(ENTipoCoche en)
        {
            bool lectura = false;
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
                lectura = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                lectura = false;
                Console.WriteLine("Error !!", ex.Message);
            }
            catch (Exception ex)
            {
                lectura = false;
                Console.WriteLine("Error !!", ex.Message);
            }
            return lectura;
        }
    }
}
