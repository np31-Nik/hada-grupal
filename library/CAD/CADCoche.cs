using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace library
{
    class CADCoche
    {
        private string constring;
        public CADCoche()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
        }
        public bool crearCoche(ENCoche en, int id)
        {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            string comando = "";//= "Insert INTO [dbo].[Coches] (id, titulo, precio,localidad,cp,descripcion,) ";//+
                                //"VALUES ('" + id + "', '" + en.titulo + "', " + en.precio + en.localidad + en.cp + en.descripcion + ")";

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
            catch (SqlException e)
            {

            }
            catch (Exception e)
            {

            }
            return creado;
        }
    }
}
