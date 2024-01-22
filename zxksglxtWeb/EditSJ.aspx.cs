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
    public partial class EditSJ : System.Web.UI.Page
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
                    DataTable table = DBA.QueryDataTable("select * from sjInfo where id=@id", new SqlParameter("@id", id));
                    if (table.Rows.Count > 0)
                    {
                        name.Text = table.Rows[0]["name"].ToString();
                        score.Text = table.Rows[0]["score"].ToString();
                        jgx.Text = table.Rows[0]["jgx"].ToString();
                        memo.Text = table.Rows[0]["memo"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('No exam paper information found, Exam Paper ID[" + id + "]！');window.location.href='SJList.aspx';</script>");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Models.SJ data = new Models.SJ();
            data.name = name.Text;
            data.score = Convert.ToInt32(score.Text);
            data.jgx = Convert.ToInt32(jgx.Text);
            data.memo = memo.Text;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@name", data.name));
            parameters.Add(new SqlParameter("@score", data.score));
            parameters.Add(new SqlParameter("@jgx", data.jgx));
            parameters.Add(new SqlParameter("@memo", data.memo));
            string id = Request.QueryString["id"];
            parameters.Add(new SqlParameter("@id", Convert.ToInt32(id)));
            DBA.ExecuteSql("update sjInfo set name=@name,score=@score,jgx=@jgx,memo=@memo where id=@id", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='SJList.aspx';</script>");

        }

        
    }
}