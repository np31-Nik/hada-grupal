using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using library;

namespace UserInterface
{
    public partial class Anuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ENAnuncio en = new ENAnuncio();
                en.id= uint.Parse(Request.QueryString["anuncio_id"]);
                en.readAnuncio();
                
            }
        }
        protected void CalcularHipoteca(object sender,EventArgs e)
        {

        }

        protected void NextImage(object sender, EventArgs e)
        {

        }

        protected void PrevImage(object sender, EventArgs e)
        {

        }

        protected void Comentar(object sender,EventArgs e)
        {

        }
    }
}