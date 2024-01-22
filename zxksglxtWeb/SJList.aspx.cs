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
    public partial class SJList : System.Web.UI.Page
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
            string sql = "delete from sjInfo where id=@id";
            DBA.ExecuteSql(sql, new SqlParameter("@id", id));
            Response.Write("<script>alert('Deleted Successfully！');window.location.href='TKList.aspx';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select *,(select count(1) from tkInfo,sjtkInfo where tkInfo.id=sjtkInfo.tk_id and  sjtkInfo.sj_id=sjInfo.id) as tk_sl from sjInfo where 1=1";
            string s_name = name.Text;
            List<SqlParameter> parameters = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(s_name))
            {
                sql += " and name like @name";
                parameters.Add(new SqlParameter("@name", "%" + s_name + "%"));
            }
            
            DataTable table = DBA.QueryDataTable(sql, parameters.ToArray());
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        
    }
}