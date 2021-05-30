using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class NestedMasterPage_perfil : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] != null && bool.Parse(Session["admin"].ToString()))
                {
                    Admin.Visible = true;
                }
                Admin.Visible = true;
            }
        }
    }
}