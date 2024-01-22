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
    public partial class EditYhxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s_code = Request.QueryString["code"];
                if (string.IsNullOrEmpty(s_code))
                {
                    Response.Write("<script>alert('The provided parameter is invalid！');window.location.href='YhxxList.aspx';</script>");
                }
                else
                {
                    DataTable table = DBA.QueryDataTable("select * from yhxx where code=@code", new SqlParameter("@code", s_code));
                    if (table.Rows.Count > 0)
                    {
                        code.Text = table.Rows[0]["code"].ToString();
                        pwd.Text = table.Rows[0]["pwd"].ToString();
                        role.Text = table.Rows[0]["role"].ToString();
                        name.Text = table.Rows[0]["name"].ToString();
                        sex.Text = table.Rows[0]["sex"].ToString();
                        birth.Text = Convert.ToDateTime(table.Rows[0]["birth"].ToString()).ToString("yyyy-MM-dd");
                        phone.Text = table.Rows[0]["phone"].ToString();
                        cardno.Text = table.Rows[0]["cardno"].ToString();

                    }
                    else
                    {
                        Response.Write("<script>alert('No user information found, User Account[" + code + "]！');window.location.href='SJList.aspx';</script>");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Models.Yhxx data = new Models.Yhxx();

            data.code = code.Text;
            data.name = name.Text;
            data.pwd = pwd.Text;
            data.birth = Convert.ToDateTime(birth.Text);
            data.phone = phone.Text;
            data.cardno = cardno.Text;
            data.role = role.Text;
            data.sex = sex.Text;

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@code", data.code));
            parameters.Add(new SqlParameter("@pwd", data.pwd));
            parameters.Add(new SqlParameter("@name", data.name));
            parameters.Add(new SqlParameter("@birth", data.birth));
            parameters.Add(new SqlParameter("@phone", data.phone));
            parameters.Add(new SqlParameter("@cardno", data.cardno));
            parameters.Add(new SqlParameter("@role", data.role));
            parameters.Add(new SqlParameter("@sex", data.sex));
            parameters.Add(new SqlParameter("@code_o", Request.QueryString["code"]));
            DBA.ExecuteSql("update yhxx set code=@code,pwd=@pwd,name=@name,birth=@birth,phone=@phone,cardno=@cardno,role=@role,sex=@sex where code=@code_o", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='YhxxList.aspx';</script>");

        }

        
    }
}