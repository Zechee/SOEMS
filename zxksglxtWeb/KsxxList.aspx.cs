using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace zxksglxtWeb
{
    public partial class KsxxList : System.Web.UI.Page
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
                    if (Session["login_role"] != null&& Session["login_role"].ToString()=="Candidate")
                    {
                        u_name.ReadOnly = true;
                        u_name.Text = Session["login_name"].ToString();
                    }
                    Button1_Click(null, null);
                }
            }
        }

        private void DeleteData()
        {
            string id = Request.QueryString["id"];
            string sql = "delete from ksxx where ks_id=@id";
            DBA.ExecuteSql(sql, new SqlParameter("@id", id));
            Response.Write("<script>alert('Deleted Successfully！');window.location.href='KsxxList.aspx';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select *,case when ks_zt='Completed' then (case when sj_jgx>ks_score then 'Fail' else 'Pass' end )else '' end as ks_jgzt from vi_ksxx where 1=1";
            string s_sj_name = sj_name.Text;
            string s_u_name = u_name.Text;
            string s_ks_zt = ks_zt.Text;
            string s_ks_jgzt = ks_jgzt.Text;
            List<SqlParameter> parameters = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(s_sj_name))
            {
                sql += " and sj_name like @sj_name";
                parameters.Add(new SqlParameter("@sj_name", "%" + s_sj_name + "%"));
            }
            if (!string.IsNullOrEmpty(s_u_name))
            {
                sql += " and u_name like @u_name";
                parameters.Add(new SqlParameter("@u_name", "%" + s_u_name + "%"));
            }
            if (!string.IsNullOrEmpty(s_ks_zt))
            {
                sql += " and ks_zt = @ks_zt";
                parameters.Add(new SqlParameter("@ks_zt", s_ks_zt));
            }
            if (s_ks_jgzt=="Pass")
            {
                sql += " and sj_jgx<=ks_score";
            }
            if (s_ks_jgzt == "Fail")
            {
                sql += " and sj_jgx>ks_score";
            }

            if (Session["login_role"] != null && Session["login_role"].ToString() == "Candidate")
            {
                parameters.Add(new SqlParameter("@u_code", Session["login_code"].ToString()));
            }

            DataTable table = DBA.QueryDataTable(sql, parameters.ToArray());
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        
    }
}