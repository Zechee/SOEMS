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
    public partial class YhxxList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string action = Request.QueryString["action"];
                if (!string.IsNullOrEmpty(action))
                {
                    switch (action)
                    {
                        case "del":
                            DeleteData();
                            break;
                    }
                }
                else
                {
                    Button1_Click(null, null);
                }
            }
        }

        private void DeleteData()
        {
            string code = Request.QueryString["code"];
            string sql = "delete from yhxx where code=@code";
            DBA.ExecuteSql(sql, new SqlParameter("@code", code));
            Response.Write("<script>alert('Deleted Successfully！');window.location.href='YhxxList.aspx';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select * from yhxx where 1=1";
            string s_code = code.Text;
            string s_name = name.Text;
            string s_cardno = cardno.Text;
            string s_role = role.Text;
            List<SqlParameter> parameters = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(s_code))
            {
                sql += " and code = @code";
                parameters.Add(new SqlParameter("@code", s_code));
            }
            if (!string.IsNullOrEmpty(s_name))
            {
                sql += " and name like @name";
                parameters.Add(new SqlParameter("@name", "%" + s_name + "%"));
            }
            if (!string.IsNullOrEmpty(s_role))
            {
                sql += " and role = @role";
                parameters.Add(new SqlParameter("@role", s_role));
            }
            if (!string.IsNullOrEmpty(s_cardno))
            {
                sql += " and cardno like @cardno";
                parameters.Add(new SqlParameter("@cardno", "%" + s_cardno + "%"));
            }

            DataTable table = DBA.QueryDataTable(sql, parameters.ToArray());
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        
    }
}