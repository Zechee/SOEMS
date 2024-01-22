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
    public partial class ImportTK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (string.IsNullOrEmpty(id))
                {
                    Response.Write("<script>alert('The provided parameter is invalid！');window.location.href='SJList.aspx';</script>");
                }
                else
                {
                    Button1_Click(null, null);
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "select *,(select count(1) from sjtkInfo where sj_id=@sj_id and tk_id=tkInfo.id) as sel from tkInfo where 1=1";
            int sj_id = Convert.ToInt32(Request.QueryString["id"]);
            string s_title = title.Text;
            string s_tklx = tklx.SelectedValue;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@sj_id", sj_id));
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
            //查询默认选过的题库放到列表
            sql = "select * from sjtkInfo where sj_id=@sj_id ";
            DataTable table_sjtk = DBA.QueryDataTable(sql, new SqlParameter("@sj_id", sj_id));
            tkids.Text = "";
            foreach (DataRow row in table_sjtk.Rows)
            {
                if (!string.IsNullOrEmpty(tkids.Text)) tkids.Text += ",";
                tkids.Text += row["tk_id"].ToString();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            string s_tkids = tkids.Text;
            string[] ids = s_tkids.Split(',').Distinct().ToArray();
            int sj_id = Convert.ToInt32(Request.QueryString["id"]);
            DBA.ExecuteSql("delete from sjtkInfo where sj_id=@sj_id", new SqlParameter("@sj_id", sj_id));
            foreach (var id in ids)
            {
                string sql = "insert into sjtkInfo(sj_id,tk_id)values(@sj_id,@tk_Id)";
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@sj_id", sj_id));
                parameters.Add(new SqlParameter("@tk_id", Convert.ToInt32(id)));
                DBA.ExecuteSql(sql, parameters.ToArray());
            }


            Response.Write("<script>alert('Question Bank Imported Successfully！');window.location.href='SJList.aspx';</script>");
        }
    }
}