using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class AddTK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Models.TK data = new Models.TK();
            data.title = title.Text;
            data.tklx = tklx.SelectedValue;
            if (tklx.SelectedValue == "1")
            {
                data.tka = tka1.Text;
                data.tkb = tkb1.Text;
                data.tkc = tkc1.Text;
                data.tkd = tkd1.Text;
                data.cka = cka1.Checked ? "1" : "0";
                data.ckb = ckb1.Checked ? "1" : "0";
                data.ckc = ckc1.Checked ? "1" : "0";
                data.ckd = ckd1.Checked ? "1" : "0";

            }
            if (tklx.SelectedValue == "2")
            {
                data.tka = tka2.Text;
                data.tkb = tkb2.Text;
                data.tkc = tkc2.Text;
                data.tkd = tkd2.Text;
                data.cka = cka2.Checked ? "1" : "0";
                data.ckb = ckb2.Checked ? "1" : "0";
                data.ckc = ckc2.Checked ? "1" : "0";
                data.ckd = ckd2.Checked ? "1" : "0";

            }
            if (tklx.SelectedValue == "3")
            {
                data.tka = "无";
                data.tkb = "无";
                data.tkc = "无";
                data.tkd = "无";
                data.cka = cka3.Checked ? "1" : "0";
                data.ckb = ckb3.Checked ? "1" : "0";
                data.ckc = "0";
                data.ckd = "0";

            }
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@title", data.title));
            parameters.Add(new SqlParameter("@tklx", data.tklx));
            parameters.Add(new SqlParameter("@tka", data.tka));
            parameters.Add(new SqlParameter("@tkb", data.tkb));
            parameters.Add(new SqlParameter("@tkc", data.tkc));
            parameters.Add(new SqlParameter("@tkd", data.tkd));
            parameters.Add(new SqlParameter("@cka", data.cka));
            parameters.Add(new SqlParameter("@ckb", data.ckb));
            parameters.Add(new SqlParameter("@ckc", data.ckc));
            parameters.Add(new SqlParameter("@ckd", data.ckd));
            DBA.ExecuteSql("insert into tkInfo(title,tklx,tka,tkb,tkc,tkd,cka,ckb,ckc,ckd)values(@title,@tklx,@tka,@tkb,@tkc,@tkd,@cka,@ckb,@ckc,@ckd)", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='TKList.aspx';</script>");

        }

        protected void tklx_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            if (tklx.Text== "1")
            {
                Panel1.Visible = true;
            }
            if (tklx.Text == "2")
            {
                Panel2.Visible = true;
            }
            if (tklx.Text == "3")
            {
                Panel3.Visible = true;
            }
        }
    }
}