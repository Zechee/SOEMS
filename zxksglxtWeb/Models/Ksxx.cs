using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zxksglxtWeb.Models
{
    public class Ksxx
    {
        /// <summary>
        /// 考试编号
        /// </summary>
        public int ks_id { get; set; }
        /// <summary>
        /// 考试账号
        /// </summary>
        public string u_code { get; set; }
        /// <summary>
        /// 试卷编号
        /// </summary>
        public int sj_id { get; set; }
        /// <summary>
        /// 状态
        /// </summary>
        public string ks_zt { get; set; }
    }
}