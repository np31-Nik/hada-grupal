using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using library;
using System.Data.SqlClient;

namespace library
{
    class CADPublicar
    {
        private string constring;
        
        public CADPublicar()
        {
            constring = ConfigurationManager.ConnectionStrings["Database"].ToString(); ;//Conexion
        }

        public bool crearAnuncio(ENPublicar en,int id) {
            bool creado = false;
            //Falta anyadir mas atibutos a la BD
            string comando = "Insert INTO [dbo].[Anuncio] (id, titulo, precio,localidad,cp,descripcion,) " +
                "VALUES ('" + id + "', '" + en.titulo + "', " + en.precio + en.localidad + en.cp + en.descripcion + ")";

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
            catch (Exception e) {
            
            }
            return creado;
        }
    }
}