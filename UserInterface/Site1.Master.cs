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
                    Response.Redirect("~/Busqueda.aspx?tipo=coches");
                    return;
                case "Propiedades":
                    Response.Redirect("~/Busqueda.aspx?tipo=propiedades");
                    return;
                case "Publicar":
                    Response.Redirect("~/Publicar.aspx");
                    return;
                case "Perfil":
                    Response.Redirect("~/Perfil.aspx");
                    return;
            }
        }

        protected void LogoClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
        }
    }
}