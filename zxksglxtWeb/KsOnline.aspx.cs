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
    public partial class KsOnline : System.Web.UI.Page
    {
        public DataTable tableTK;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (string.IsNullOrEmpty(id))
            {
                Response.Write("<script>alert('The provided parameter is invalid！');window.location.href='KsxxList.aspx';</script>");
            }
            else
            {
                int ks_id = Convert.ToInt32(id);
                tableTK = DBA.QueryDataTable("select * from vi_sjtk where sj_id in (select sj_id from ksxx where ks_id=@ks_id and ks_zt in ('Pending','In Progress'))", new System.Data.SqlClient.SqlParameter("@ks_id", ks_id));
                if (tableTK.Rows.Count <= 0)
                {
                    Response.Write("<script>alert('Exams that are not in the 'Pending' or 'In Progress' status are not allowed to be taken！');window.location.href='KsxxList.aspx';</script>");
                    return;
                }

                if (!IsPostBack)
                {
                    int ret = DBA.ExecuteSql("update ksxx set ks_zt='In Progress',kssj=getdate() where ks_id=@ks_id and ks_zt='Pending'", new System.Data.SqlClient.SqlParameter("@ks_id", ks_id));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int ks_id = Convert.ToInt32(id);
            List<Models.Kssj> dataList = new List<Models.Kssj>();
            string guid = Guid.NewGuid().ToString();
            foreach(var key in Request.Form.AllKeys)
            {
                //设置题库信息
                if (key.StartsWith("tk")&&key.Contains("_"))
                {
                    Models.Kssj kssj = new Models.Kssj();
                    int tk_id = Convert.ToInt32(key.Split('_')[1]);
                    var tmp = dataList.Where(a => a.tk_id == tk_id);
                    if (tmp.Count() > 0)
                    {
                        kssj = tmp.FirstOrDefault();
                    }
                    else
                    {
                        kssj.tk_id = tk_id;
                        dataList.Add(kssj);
                    }

                    string data = Request.Form[key];

                    if (key.StartsWith("tk1"))
                    {
                        if (data == "a")
                        {
                            kssj.cka = "1";
                        }
                        if (data == "b")
                        {
                            kssj.ckb = "1";
                        }
                        if (data == "c")
                        {
                            kssj.ckc = "1";
                        }
                        if (data == "d")
                        {
                            kssj.ckd = "1";
                        }
                    }
                    if (key.StartsWith("tka2"))
                    {
                        kssj.cka = data=="on"?"1":"0";
                    }
                    if (key.StartsWith("tkb2"))
                    {
                        kssj.ckb = data == "on" ? "1" : "0";
                    }
                    if (key.StartsWith("tkc2"))
                    {
                        kssj.ckc = data == "on" ? "1" : "0";
                    }
                    if (key.StartsWith("tkd2"))
                    {
                        kssj.ckd = data == "on" ? "1" : "0";
                    }
                    if (key.StartsWith("tk3"))
                    {
                        if (data == "a")
                        {
                            kssj.cka = "1";
                        }
                        if (data == "b")
                        {
                            kssj.ckb = "1";
                        }
                    }
                }
            }
            //循环取值
            foreach (var data in dataList)
            {
                //默认设置0
                if (string.IsNullOrEmpty(data.cka)) data.cka = "0";
                if (string.IsNullOrEmpty(data.ckb)) data.ckb = "0";
                if (string.IsNullOrEmpty(data.ckc)) data.ckc = "0";
                if (string.IsNullOrEmpty(data.ckd)) data.ckd = "0";
                //设置正确是不正确的值
                DataRow row = tableTK.Rows.Cast<DataRow>().Where(a => a["id"].ToString() == data.tk_id.ToString()).FirstOrDefault();
                if (row["cka"].ToString() == data.cka && row["ckb"].ToString() == data.ckb && row["ckc"].ToString() == data.ckc && row["ckd"].ToString() == data.ckd)
                {
                    data.result = "1";
                }
                else
                {
                    data.result = "0";
                }

                data.sj_id = Convert.ToInt32(row["sj_id"].ToString());

                string sql = "insert into kssj(ks_id,sj_id,tk_id,cka,ckb,ckc,ckd,result,kssj,jssj)values(@ks_id,@sj_id,@tk_id,@cka,@ckb,@ckc,@ckd,@result,@kssj,@jssj)";
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("@ks_Id", ks_id));
                parameters.Add(new SqlParameter("@sj_id", data.sj_id));
                parameters.Add(new SqlParameter("@tk_id", data.tk_id));
                parameters.Add(new SqlParameter("@cka", data.cka));
                parameters.Add(new SqlParameter("@ckb", data.ckb));
                parameters.Add(new SqlParameter("@ckc", data.ckc));
                parameters.Add(new SqlParameter("@ckd", data.ckd));
                parameters.Add(new SqlParameter("@result", data.result));
                parameters.Add(new SqlParameter("@kssj", DateTime.Now));
                parameters.Add(new SqlParameter("@jssj", DateTime.Now));
                DBA.ExecuteSql(sql, parameters.ToArray());
            }

            DBA.ExecuteSql("update ksxx set ks_zt='Completed',jssj=getdate() where ks_id=@ks_id", new System.Data.SqlClient.SqlParameter("@ks_id", ks_id));

            Response.Write("<script>alert(' Exam Finished！');window.location.href='KsxxList.aspx';</script>");
        }
    }
}