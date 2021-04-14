using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace QLTV
{
    public partial class PhieuMuon : System.Web.UI.Page
    {
        ketnoi kn = new ketnoi();

        private readonly Random _random = new Random();

        // Generates a random number within a range.      
        public int RandomNumber(int min, int max)
        {
            return _random.Next(min, max);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable cart = new DataTable();
                if (Session["cart"] == null)
                {
                    this.Label1.Text = "Không có sản phẩm nào";
                }
                else
                {
                    //Lấy thông tin giỏ hàng từ Session["cart"]
                    cart = Session["cart"] as DataTable;
                }
                //Hiện thị thông tin giỏ hàng
                GridView1.DataSource = cart;
                GridView1.DataBind();

                //show pm
                this.txtngaymuon.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Write(Request.Cookies["Id"].Value);
            string strngaytra = this.txtngaytra.Text;
            DateTime ngaytra = 
             DateTime.ParseExact(strngaytra, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime ngaymuon = DateTime.Now;
            int madocgia = Int32.Parse(Request.Cookies["Id"].Value);
            string ghichu = !string.IsNullOrEmpty(this.txtghichu.Text) ? this.txtghichu.Text : "";
            int num = RandomNumber(1, 100000);
            int kq = kn.xuly("insert into phieumuon values ('" + num + "', '" + madocgia + "', '" + ngaymuon + "','" + ngaytra + "','" + ghichu + "')");
            if (kq == 1)
            {
                DataTable cart = new DataTable();
                cart = Session["cart"] as DataTable;
                int id = 0;
                foreach (DataRow dr in cart.Rows)
                {
                    id = RandomNumber(1, 100000);
                    kn.xuly("insert into chitietpm values ('" + id + "', '" + num + "', '" + int.Parse(dr["ID"].ToString()) + "','" + int.Parse(dr["Quantity"].ToString()) + "')");
                }
                Response.Write("<script>Mượn thành công</script>");
                Response.Redirect("Sach.aspx");
            }
            else
            {
                Response.Write("<script><p><b>Error: </b>Lỗi mượn không thành công!</p></script>");
            }
        }
    }
}