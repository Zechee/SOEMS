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
    public partial class AddKsxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSJ();
                InitRole();
            }
        }

        private void InitSJ()
        {
            DataTable tableSjInfo = DBA.QueryDataTable("select * from sjInfo");
            DataRow row = tableSjInfo.NewRow();
            row["id"] = DBNull.Value;
            row["name"] = "--请选择试卷--";
            sj_id.DataSource = tableSjInfo;
            sj_id.DataValueField = "id";
            sj_id.DataTextField = "name";
            sj_id.DataBind();
        }
        private void InitRole()
        {
            DataTable tableYhxx = DBA.QueryDataTable("select * from yhxx where role='Candidate'");
            DataRow row = tableYhxx.NewRow();
            row["code"] = "";
            row["name"] = "--Please select a candidate--";
            u_code.DataSource = tableYhxx;
            u_code.DataValueField = "code";
            u_code.DataTextField = "name";
            u_code.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Models.Ksxx data = new Models.Ksxx();
            data.u_code = u_code.SelectedValue;
            data.sj_id = Convert.ToInt32(sj_id.SelectedValue);
            data.ks_zt = "Pending";

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@u_code", data.u_code));
            parameters.Add(new SqlParameter("@sj_id", data.sj_id));
            parameters.Add(new SqlParameter("@ks_zt", data.ks_zt));
            DBA.ExecuteSql("insert into ksxx(u_code,sj_id,ks_zt)values(@u_code,@sj_id,@ks_zt)", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='KsxxList.aspx';</script>");

        }

        
    }
}