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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(UserPanel.Visible == true)
            {
                UserPanel.Visible = false;
                AdminPanel.Visible = true;
            }
            else
            {
                UserPanel.Visible = true;
                AdminPanel.Visible = false;
            }
        }
    }
}