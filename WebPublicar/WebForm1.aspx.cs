using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPublicar
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mensaje.Text = "";
        }

        protected void PublicarClick(object sender, EventArgs e) {
            Response.Redirect("");
        }

        protected void InicioClick(object sender, EventArgs e) {
            Response.Redirect("");
        }
    }
}