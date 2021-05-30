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

        public bool readMarcaCoche(ENMarcaCoche en)
        {
          
            bool lectura = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[MarcaCoche] Where marca = '" + en.companyia + "' ";
                SqlCommand consulta = new SqlCommand(select, conexion);
                SqlDataReader buscar = consulta.ExecuteReader();
                buscar.Read();
                if (buscar["MarcaCoche"].ToString() == en.companyia)
                {
                    en.companyia = buscar["MarcaCoche"].ToString();
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



        public bool createMarcaCoche(ENMarcaCoche en )
        {
           
            bool creado = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Insert into [dbo].[MarcaCoche] (marca) VALUES ('" + en.companyia + ")";
                SqlCommand consulta = new SqlCommand(select, conexion);
                consulta.ExecuteNonQuery();
                creado = true;
                conexion.Close();
            }
            catch (SqlException e)
            {
                creado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            catch (Exception e)
            {
                creado = false;
                Console.WriteLine("User operation has failed.Error: {0}", e.Message);
            }
            return creado;

        }


        public bool deleteMarcaCoche(ENMarcaCoche en)
        {
           
            bool borrado = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Delete from [dbo].[MarcaCoche] wHERE marca = '" + en.companyia + "'";
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



        public bool updateMarcaCoche(ENMarcaCoche en)
        {
            bool actualizado = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "update [dbo].[MarcaCoche] SET marca= '"  + en.companyia + "'";
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




        public bool readNextMarcaCoche(ENMarcaCoche en)
        {
            bool read = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();

                string comando = "select * from [dbo].[MarcaCoche]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                string aux = en.companyia;
                int cont = 0;

                while (lector.Read())
                {
                    en.companyia = lector["marca"].ToString();
                   

                    if (cont == 1)
                    {
                        break;
                    }
                    if (lector["marca"].ToString() == aux)
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



        public bool readFirstMarcaCoche(ENMarcaCoche en )
        {
           
            bool leer = false;
            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(constring);
                conexion.Open();
                string select = "Select * from [dbo].[MarcaCcohe]";
                SqlCommand consulta = new SqlCommand(select, conexion);
                SqlDataReader buscar = consulta.ExecuteReader();
                buscar.Read();
                while (buscar.Read() && !leer)
                {
                    if (buscar["marca"].ToString() == en.companyia)
                    {
                        leer = true;
                    }
                    en.companyia = buscar["marca"].ToString();
                    
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
