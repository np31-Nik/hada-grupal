using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void menu_click(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            switch (e.Item.Value) 
            {
                case "Inicio":
                    Response.Redirect("~/Principal.aspx");
                    return;
                case "Coches":
                    Response.Redirect("~/Busqueda.aspx");
                    return;
                case "Propiedades":
                    Response.Redirect("~/Busqueda.aspx");
                    return;
                case "Zona Clientes":
                    Response.Redirect("~/Registro.aspx");
                    return;
            }
        }
    }
}