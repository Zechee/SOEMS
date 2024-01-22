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
    public partial class TKList : System.Web.UI.Page
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
            string id = Request.QueryString["id"];
            string sql = "delete from tkInfo where id=@id";
            DBA.ExecuteSql(sql, new SqlParameter("@id", id));
            Response.Write("<script>alert('Deleted Successfully！');window.location.href='TKList.aspx';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select * from tkInfo where 1=1";
            string s_title = title.Text;
            string s_tklx = tklx.SelectedValue;
            List<SqlParameter> parameters = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(s_title))
            {
                sql += " and title like @title";
                parameters.Add(new SqlParameter("@title", "%" + s_title + "%"));
            }
            if (!string.IsNullOrEmpty(s_tklx))
            {
                sql += " and tklx = @tklx";
                parameters.Add(new SqlParameter("@tklx", s_tklx));
            }
            DataTable table = DBA.QueryDataTable(sql, parameters.ToArray());
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        
    }
}