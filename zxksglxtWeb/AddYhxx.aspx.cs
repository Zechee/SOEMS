using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class AddYhxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            DBA.ExecuteSql("insert into yhxx(code,pwd,name,birth,phone,cardno,role,sex)values(@code,@pwd,@name,@birth,@phone,@cardno,@role,@sex)", parameters.ToArray());
            Response.Write("<script>alert('Saved successfully！');window.location.href='YhxxList.aspx';</script>");

        }

        
    }
}