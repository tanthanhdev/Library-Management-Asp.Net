using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace QLTV
{
    public class ketnoi
    {
        SqlConnection con;
        private void layknoi()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\QLTV.mdf;Integrated Security=True");
            con.Open();
        }
        
        private void dongknoi()
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        public DataTable laydata(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                layknoi();
                SqlDataAdapter adap = new SqlDataAdapter(sql, con);
                adap.Fill(dt);
            }
            catch (SqlException)
            {
                //dt = null;
            }
            finally
            {
                dongknoi();
            }
            return dt;
        }

        public int xuly(string sql)
        {
            int kq = 0;
            try
            {
                layknoi();
                SqlCommand cmd = new SqlCommand(sql, con);
                kq = cmd.ExecuteNonQuery();
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                dongknoi();
            }
            return kq;
        }
    }
}