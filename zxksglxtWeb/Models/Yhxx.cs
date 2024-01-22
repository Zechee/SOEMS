using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zxksglxtWeb.Models
{
    public class Yhxx
    {
        /// <summary>
        /// 账号
        /// </summary>
        public string code { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string pwd { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 用户角色
        /// </summary>
        public string role { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        public string sex { get; set; }
        /// <summary>
        /// 出生日期
        /// </summary>
        public DateTime birth { get; set; }
        /// <summary>
        /// 联系电话
        /// </summary>
        public string phone { get; set; }
        /// <summary>
        /// 身份证号
        /// </summary>
        public string cardno { get; set; }
    }
}