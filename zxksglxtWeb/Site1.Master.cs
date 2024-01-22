using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_code"] == null || string.IsNullOrEmpty(Session["login_code"].ToString()))
            {
                Response.Write("<script>alert('User Not Logged In');window.location.href='Login.aspx';</script>");
            }
        }
    }
}