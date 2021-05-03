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

        }

        protected void ModPerfil_Click(object sender, EventArgs e)
        {
            UpdatePerfil.Visible = true;
            PasswordPanel.Visible = true;
            Nombre.ReadOnly = false;
            Apellido.ReadOnly = false;
            Emali.ReadOnly = false;
            Telefono.ReadOnly = false;
            Premium.Enabled = true;
        }

        protected void UpdatePerfil_Click(object sender, EventArgs e)
        {
            UpdatePerfil.Visible = false;
            PasswordPanel.Visible = false;
            Nombre.ReadOnly = true;
            Apellido.ReadOnly = true;
            Emali.ReadOnly = true;
            Telefono.ReadOnly = true;
            Premium.Enabled = false;
        }
    }
}