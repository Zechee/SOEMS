using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace zxksglxtWeb
{
    public partial class Default : System.Web.UI.Page
    {
        public int NUM_1 = 0;   //题库
        public int NUM_2 = 0;   //试卷
        public int NUM_3 = 0;   //用户人数
        public int NUM_4 = 0;   //不合格人数
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login_role"] != null && Session["login_role"].ToString() == "Administrator")
                {
                    NUM_1 = (int)DBA.ExecuteScalar("select count(1) from tkInfo");
                    NUM_2 = (int)DBA.ExecuteScalar("select count(1) from sjInfo");
                    NUM_3 = (int)DBA.ExecuteScalar("select count(1) from yhxx");
                    NUM_4 = (int)DBA.ExecuteScalar("select count(1) from vi_ksxx where sj_jgx>ks_score and ks_zt='Completed'");
                }
                if (Session["login_role"] != null && Session["login_role"].ToString() == "Candidate")
                {
                    NUM_1 = (int)DBA.ExecuteScalar("select count(1) from vi_ksxx where u_code=@u_code", new System.Data.SqlClient.SqlParameter("@u_code", Session["login_code"].ToString()));
                    NUM_2 = (int)DBA.ExecuteScalar("select count(1) from vi_ksxx where sj_jgx<=ks_score and ks_zt='Completed' and u_code=@u_code", new System.Data.SqlClient.SqlParameter("@u_code", Session["login_code"].ToString()));
                    NUM_3 = (int)DBA.ExecuteScalar("select count(1) from vi_ksxx where sj_jgx>ks_score and ks_zt='Completed' and u_code=@u_code", new System.Data.SqlClient.SqlParameter("@u_code", Session["login_code"].ToString()));
                }
            }
        }
    }
}