using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace zxksglxtWeb
{
    public static class DBA
    {
        public static readonly string ConStr;
        static DBA()
        {
            ConStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            //ConStr = "Server=Q\\MSSQLSERVER_1;Database=zxksglxtWeb2022;Integrated Security=True;";


        }

        public static DataTable QueryDataTable(string sql,params SqlParameter[] sqlParameters)
        {
            SqlConnection con = new SqlConnection(ConStr);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(sqlParameters);
            DataTable table = new DataTable();
            SqlDataAdapter dapter = new SqlDataAdapter(cmd);
            dapter.Fill(table);
            cmd.Parameters.Clear();
            con.Close();
            return table;
        }
        public static object ExecuteScalar(string sql, params SqlParameter[] sqlParameters)
        {
            SqlConnection con = new SqlConnection(ConStr);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(sqlParameters);
            object ret = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            con.Close();
            return ret;
        }
        public static int ExecuteSql(string sql, params SqlParameter[] sqlParameters)
        {
            SqlConnection con = new SqlConnection(ConStr);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(sqlParameters);
            int ret = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            con.Close();
            return ret;
        }
    }
}