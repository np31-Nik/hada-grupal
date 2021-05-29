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
    public class CADBanco
    {
        private String conexstring;

        public CADBanco()
        {
            conexstring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createBanco(ENBanco en)
        {
            bool creado = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "insert into [dbo].[Banco](banco,tel,email) values " + "('" + en.BANCO + "','" + en.TELEFONO + "','" + en.EMAIL + "')";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                consulta.ExecuteNonQuery();
                creado = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                creado = false;
            }
            catch (Exception ex)
            {
                creado = false;
            }

            return creado;
        }

        public bool deleteBanco(ENBanco en)
        {
            bool eliminado = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "delete from [dbo].[Banco] where banco='" + en.BANCO + "'";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                consulta.ExecuteNonQuery();
                eliminado = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                eliminado = false;
            }
            catch (Exception ex)
            {
                eliminado = false;
            }

            return eliminado;
        }

        public bool readBanco(ENBanco en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Banco] where banco='" + en.BANCO + "'";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                lector.Read();

                if (lector["banco"].ToString() == en.BANCO)
                {
                    en.BANCO = lector["banco"].ToString();
                    en.TELEFONO = lector["tel"].ToString();
                    en.EMAIL = lector["email"].ToString();
                    leido = true;
                }
                lector.Close();
                conexion.Close();
            }
            catch (SqlException ex)
            {
                leido = false;
            }
            catch (Exception ex)
            {
                leido = false;
            }

            return leido;
        }

        public bool readFirstBanco(ENBanco en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Banco]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                lector.Read();

                en.BANCO = lector["banco"].ToString();
                en.TELEFONO = lector["tel"].ToString();
                en.EMAIL = lector["email"].ToString();
                leido = true;

                lector.Close();
                leido = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                leido = false;
            }
            catch (Exception ex)
            {
                leido = false;
            }

            return leido;
        }

        public bool readNextBanco(ENBanco en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Banco]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                string aux = en.BANCO;
                int cont = 0;

                while (lector.Read())
                {
                    en.BANCO = lector["banco"].ToString();
                    en.TELEFONO = lector["tel"].ToString();
                    en.EMAIL = lector["email"].ToString();

                    if (cont == 1)
                    {
                        break;
                    }
                    if (lector["banco"].ToString() == aux)
                    {
                        cont++;
                    }
                }

                lector.Close();
                leido = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                leido = false;
            }
            catch (Exception ex)
            {
                leido = false;
            }

            return leido;
        }

        public bool readPrevBanco(ENBanco en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Banco]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                string aux = en.BANCO;

                while (lector.Read())
                {
                    if (lector["Banco"].ToString() == aux)
                    {
                        break;
                    }

                    en.BANCO = lector["banco"].ToString();
                    en.TELEFONO = lector["tel"].ToString();
                    en.EMAIL = lector["email"].ToString();
                }

                lector.Close();
                leido = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                leido = false;
            }
            catch (Exception ex)
            {
                leido = false;
            }

            return leido;
        }

        public bool updateBanco(ENBanco en)
        {
            bool act = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "update [dbo].[Banco] set email='" + en.EMAIL + "',tel='" + en.TELEFONO + "' where banco='" + en.BANCO + "'";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                consulta.ExecuteNonQuery();
                act = true;
                conexion.Close();
            }
            catch (SqlException ex)
            {
                act = false;
            }
            catch (Exception ex)
            {
                act = false;
            }

            return act;
        }
    }
}
