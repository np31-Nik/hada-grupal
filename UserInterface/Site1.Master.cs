using System;


namespace UserInterface
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        static string texto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nif"] == null)
            {
                texto = "Iniciar Sesion";
                menu.FindItem("Perfil").Text = texto;
            }
            else
            {
                texto = "Perfil";
                menu.FindItem("Perfil").Text = texto;
            }
        }

        protected void menu_click(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            switch (e.Item.Value) 
            {
                case "Inicio":
                    Response.Redirect("~/Principal.aspx",false);
                    return;
                case "Coches":
                    Response.Redirect("~/Busqueda.aspx?tipo=coches", false);
                    return;
                case "Propiedades":
                    Response.Redirect("~/Busqueda.aspx?tipo=propiedades", false);
                    return;
                case "Publicar":
                    Response.Redirect("~/Publicar.aspx", false);
                    return;
                case "Perfil":
                    if (texto == "Perfil")
                    {
                        Response.Redirect("~/Perfil.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("~/Registros.aspx", false);
                    }
                    
                    return;
            }
        }

        protected void LogoClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx", false);
        }
    }
}