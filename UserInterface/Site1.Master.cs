using System;

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
                    Response.Redirect("~/Principal.aspx");
                    return;
                case "Propiedades":
                    Response.Redirect("~/Principal.aspx");
                    return;
                case "Zona Clientes":
                    Response.Redirect("~/Principal.aspx");
                    return;
            }
        }
    }
}