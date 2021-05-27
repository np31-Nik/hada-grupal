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
    public class CADHipoteca
    {
        private String conexstring;

        public CADHipoteca()
        {
            conexstring = ConfigurationManager.ConnectionStrings["Database"].ToString();
        }

        public bool createHipoteca(ENHipoteca en)
        {
            bool creado = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "insert into [dbo].[Hipoteca](id,banco,desde,hasta,interes,numSolicitudes) values " + "('" + en.ID + "','" + en.BANCO + "','" + en.FECHADESDE + "','" + en.FECHAHASTA + "','" + en.INTERESES + "','" + en.NUMSOLICITUDES + "')";
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

        public bool deleteHipoteca(ENHipoteca en)
        {
            bool eliminado = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "delete from [dbo].[Hipoteca] where id='" + en.ID + "'";
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

        public bool readHipoteca(ENHipoteca en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Hipoteca] where id='" + en.ID + "'";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                lector.Read();

                if (int.Parse(lector["id"].ToString()) == en.ID)
                {
                    en.ID = int.Parse(lector["id"].ToString());
                    en.BANCO = lector["banco"].ToString();
                    en.FECHADESDE = int.Parse(lector["desde"].ToString());
                    en.FECHAHASTA = int.Parse(lector["hasta"].ToString());
                    en.INTERESES = int.Parse(lector["interes"].ToString());
                    en.NUMSOLICITUDES = int.Parse(lector["numSolicitudes"].ToString());
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

        public bool readFirstHipoteca(ENHipoteca en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Hipoteca]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                lector.Read();

                en.ID = int.Parse(lector["id"].ToString());
                en.BANCO = lector["banco"].ToString();
                en.FECHADESDE = int.Parse(lector["desde"].ToString());
                en.FECHAHASTA = int.Parse(lector["hasta"].ToString());
                en.INTERESES = int.Parse(lector["interes"].ToString());
                en.NUMSOLICITUDES = int.Parse(lector["numSolicitudes"].ToString());
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

        public bool readNextHipoteca(ENHipoteca en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Hipoteca]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                int aux = en.ID;
                int cont = 0;

                while (lector.Read())
                {
                    en.ID = int.Parse(lector["id"].ToString());
                    en.BANCO = lector["banco"].ToString();
                    en.FECHADESDE = int.Parse(lector["desde"].ToString());
                    en.FECHAHASTA = int.Parse(lector["hasta"].ToString());
                    en.INTERESES = int.Parse(lector["interes"].ToString());
                    en.NUMSOLICITUDES = int.Parse(lector["numSolicitudes"].ToString());

                    if (cont == 1)
                    {
                        break;
                    }
                    if (int.Parse(lector["id"].ToString()) == aux)
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

        public bool readPrevHipoteca(ENHipoteca en)
        {
            bool leido = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "select * from [dbo].[Hipoteca]";
                SqlCommand consulta = new SqlCommand(comando, conexion);
                SqlDataReader lector = consulta.ExecuteReader();
                int aux = en.ID;

                while (lector.Read())
                {
                    if (int.Parse(lector["id"].ToString()) == aux)
                    {
                        break;
                    }

                    en.ID = int.Parse(lector["id"].ToString());
                    en.BANCO = lector["banco"].ToString();
                    en.FECHADESDE = int.Parse(lector["desde"].ToString());
                    en.FECHAHASTA = int.Parse(lector["hasta"].ToString());
                    en.INTERESES = int.Parse(lector["interes"].ToString());
                    en.NUMSOLICITUDES = int.Parse(lector["numSolicitudes"].ToString());
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

        public bool updateHipoteca(ENHipoteca en)
        {
            bool act = false;

            try
            {
                SqlConnection conexion = null;
                conexion = new SqlConnection(conexstring);
                conexion.Open();

                string comando = "update [dbo].[Hipoteca] set banco='" + en.BANCO + "',desde='" + en.FECHADESDE + "',hasta='" + en.FECHAHASTA + "',interes='" + en.INTERESES + "',numSolicitudes='" + en.NUMSOLICITUDES + "' where id='" + en.ID + "'";
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
