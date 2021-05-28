using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (Session["nif"]!=null)
            {
                Nif.Text = Session["nif"].ToString();
                Nombre.Text = Session["nombre"].ToString();
                Apellido.Text = Session["apellido"].ToString();
                Telefono.Text = Session["nombre"].ToString();
                Emali.Text = Session["nombre"].ToString();
                Premium.Checked = bool.Parse(Session["premium"].ToString());
            }
            else
            {
                Response.Redirect("~/Inicio.aspx");
            }
            */
        }

        protected void ModPerfil_Click(object sender, EventArgs e)
        {
            UpdatePerfil.Visible = true;
            PasswordPanel.Visible = true;
            Nombre.Enabled = true;
            Apellido.Enabled = true;
            Emali.Enabled = true;
            Telefono.Enabled = true;
            Premium.Enabled = true;
        }

        protected void UpdatePerfil_Click(object sender, EventArgs e)
        {
            UpdatePerfil.Visible = false;
            PasswordPanel.Visible = false;
            Nombre.Enabled = false;
            Apellido.Enabled = false;
            Emali.Enabled = false;
            Telefono.Enabled = false;
            Premium.Enabled = false;
        }
    }
}