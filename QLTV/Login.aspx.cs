using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace QLTV
{
    public partial class Login : System.Web.UI.Page
    {
        ketnoi kn = new ketnoi();
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\QLTV.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string ten = this.Login1.UserName;
            string matkhau = this.Login1.Password;
            string sql = "select * from nguoidung where taikhoan = '" + ten + "' and matkhau = '" + matkhau + "'";

            DataTable table = new DataTable();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.Fill(table);
            }
            catch (SqlException err)
            {
                Response.Write("<p><b>Error: </b>" + err.Message + "</p>");
            }

            if (table.Rows.Count != 0)
            {
                Response.Cookies["Tendangnhap"].Value = ten;
                Response.Cookies["Id"].Value = table.Rows[0].Field<int>("Id").ToString();
                

                Response.Redirect("Sach.aspx");
                
            }
            else this.Login1.FailureText = "Tên đăng nhập hay mật khẩu không đúng!";
        }
    }
}