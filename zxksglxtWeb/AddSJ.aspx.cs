using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class AddSJ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            DBA.ExecuteSql("insert into sjInfo(name,score,jgx,memo)values(@name,@score,@jgx,@memo)", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='SJList.aspx';</script>");

        }

        
    }
}