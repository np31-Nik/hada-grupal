﻿using System;
using System.Configuration;
using System.Data.SqlClient;

namespace library
{
    public class CADCoche
    {
        private string constring;
        public CADCoche()
        {
            constring = ConfigurationManager.ConnectionStrings["DatabaseConexion"].ToString();//Conexion
        }
        public bool createCoche(ENCoche en)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD

            SqlConnection conn = null;
            try
            {
                string comando = "Insert INTO [dbo].[Coche] (anuncio,ano,marca,tipo) " +
                "VALUES ('" + en.id + "', '" + en.anyo + "', '" + en.marca.companyia + "', '" + en.tipo.categoria + "')";

                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                cmd.ExecuteNonQuery();
                creado = true;
            }
            catch (SqlException e)
            {

            }
            catch (Exception e)
            {

            }
            finally {
                if(conn!=null)conn.Close();
            }
            return creado;
        }

        public bool readCoche(ENCoche en)
        {
            bool read = false;
            SqlConnection conn = null;

            try
            {
                string comando = "select * From [dbo].[Coche] where anuncio='" + en.id + "'";
                conn = new SqlConnection(constring);
                conn.Open();
                SqlCommand cmd = new SqlCommand(comando, conn);
                SqlDataReader buscar = cmd.ExecuteReader();
                while (buscar.Read() && !read)
                {
                    if (buscar["anuncio"].ToString() == en.id.ToString())
                    {
                        read = true;
                        en.id = int.Parse(buscar["anuncio"].ToString());
                        en.marca.companyia = buscar["marca"].ToString();
                        en.tipo.categoria = buscar["tipo"].ToString();
                        en.anyo = int.Parse(buscar["ano"].ToString()); /////////REVISAR
                    }
                }
                buscar.Close();
                conn.Close();

            }
            catch (SqlException ex)
            {
                read = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                read = false;
                Console.WriteLine("User operation hasfailed.Error: {0}", ex.Message);

            }
            finally
            {
                if (conn != null) conn.Close();
            }
            return read;
        }
        public bool updateCoche(ENCoche en)
        {
            bool updated = false;
            SqlConnection conn = null;
            try
            {
                string comando = "UPDATE [dbo].[Coche] SET " +
               "tipo= '" + en.tipo.categoria + "' ," +
               "ano= '" + en.anyo + "' ," +
               "marca=" + en.marca.companyia +
               "WHERE anuncio = '" + en.id + "'";

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
            finally
            {
                if (conn != null) conn.Close();
            }

            return updated;
        }
        public bool deleteCoche(ENCoche en)
        {
            SqlConnection conn = null;
            bool borrado = false;
            
            try
            {
                string comando = "DELETE FROM [dbo].[Coche] WHERE anuncio = '" + en.id + "'";

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
            finally
            {
                if (conn != null) conn.Close();
            }

            return borrado;

        }
    }
}
