using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CustomValidator1.ErrorMessage = "";
            CustomValidator1.IsValid = true;
            if (Page.IsValid)
            {
                string sql = "select * from yhxx where code=@code and pwd=@pwd and role=@role";
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@code", code.Text));
                parameters.Add(new SqlParameter("@pwd", pwd.Text));
                parameters.Add(new SqlParameter("@role", role.Text));
                DataTable table = DBA.QueryDataTable(sql, parameters.ToArray());
                if (table.Rows.Count > 0)
                {
                    DataRow row = table.Rows[0];
                    Session["login_code"] = row["code"].ToString();
                    Session["login_role"] = row["role"].ToString();
                    Session["login_name"] = row["name"].ToString();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    CustomValidator1.ErrorMessage = "账号密码输入有误，请重新输入！";
                    CustomValidator1.IsValid = false;
                    ValidationSummary1.ShowSummary = true;
                }
            }
        }
    }
}