using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV
{
    public partial class QuanLySach : System.Web.UI.Page
    {
        ketnoi kn = new ketnoi();
        String cnn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\QLTV.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["IdAdmin"] == null) Response.Redirect("LoginAdmin.aspx");
            if (Page.IsPostBack) return;
            SqlConnection con = new SqlConnection(cnn);
            String q = "select * from sach";
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataSourceID = String.Empty;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public void LaySachTheoLoai(string maloai)
        {
            string sql;
            if (maloai == "0")
                sql = "Select * from sach";
            else
                sql = "Select * from sach where maloai ='" + maloai + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LaySachTheoLoai(DropDownList1.SelectedItem.Value.ToString());
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string tensach = e.Values["tensach"].ToString();
            int kq = kn.xuly("delete from sach where tensach = '" + tensach + "'");
            if (kq > 0) //neu cap nhat duoc thi hien thi thong bao
            {
                Response.Write("<script>alert('Xóa thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM sach");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Xóa không thanh công');</script>");

            }
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            TextBox txtmasach = (TextBox)GridView1.FooterRow.FindControl("txtmasach");
            TextBox txttensach = (TextBox)GridView1.FooterRow.FindControl("txttensach");
            TextBox txttacgia = (TextBox)GridView1.FooterRow.FindControl("txttentg");
            TextBox txtngayxb = (TextBox)GridView1.FooterRow.FindControl("txtngayxb");
            TextBox txtnhaxb = (TextBox)GridView1.FooterRow.FindControl("txtnhaxb");
            TextBox txthinh = (TextBox)GridView1.FooterRow.FindControl("txthinh");
            TextBox txttinhtrang = (TextBox)GridView1.FooterRow.FindControl("txttinhtrang");
            TextBox txtmota = (TextBox)GridView1.FooterRow.FindControl("txtmota");
            TextBox txtsoluong = (TextBox)GridView1.FooterRow.FindControl("txtsoluong");
            TextBox txtmaloai = (TextBox)GridView1.FooterRow.FindControl("txtloaisach");

            string masach = txtmasach.Text;
            string tensach = txttensach.Text;
            string tacgia = txttacgia.Text;
            string ngayxb = txtngayxb.Text;
            string nhaxb = txtnhaxb.Text;
            string hinh = txthinh.Text;
            string tinhtrang = txttinhtrang.Text;
            string mota = txtmota.Text;
            string soluong = txtsoluong.Text;
            string maloai = txtmaloai.Text;
            int kq = kn.xuly("insert into sach values ('" + masach + "' , N'" + tensach + "' , N'" + tacgia + "' , '" + ngayxb + "' , '" + nhaxb + "' , N'" + hinh + "' , '" + tinhtrang + "' , N'" + mota + "' , '" + soluong + "' , '" + maloai + "')");

            if (kq > 0) // neu cap nhat duoc thi hien thi khong bao
            {
                Response.Write("<script>alert('them moi thanh cong');</script>");
                GridView1.DataSource = kn.laydata("select * from sach");
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('then moi khong thanh cong');</script>");
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            LaySachTheoTinhTrang(DropDownList2.SelectedItem.Value.ToString());
        }
        public void LaySachTheoTinhTrang(string tinhtrang)
        {
            string sql;
            if (tinhtrang == "0")
                sql = "Select * from sach";
            else
                sql = "Select * from sach where tinhtrang ='" + tinhtrang + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            TextBox txthinh = (TextBox)GridView1.FooterRow.FindControl("txthinh");
            StringBuilder sb = new StringBuilder();
            if (FileUpload1.HasFile)
            {
                try
                {
                    sb.AppendFormat(" Uploading file: {0}", FileUpload1.FileName);

                    //saving the file
                    string fileName = "images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                    string filePath = MapPath(fileName);
                    FileUpload1.SaveAs(filePath);
                    txthinh.Text = FileUpload1.FileName;
                    //Showing the file information
                    sb.AppendFormat("<br/> Save As: {0}", FileUpload1.PostedFile.FileName);
                    sb.AppendFormat("<br/> File type: {0}", FileUpload1.PostedFile.ContentType);
                    sb.AppendFormat("<br/> File length: {0}", FileUpload1.PostedFile.ContentLength);
                    sb.AppendFormat("<br/> File name: {0}", FileUpload1.PostedFile.FileName);

                }
                catch (Exception ex)
                {
                    sb.Append("<br/> Error <br/>");
                    sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
                }

            }
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = kn.laydata("SELECT * from sach");
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView1.DataSource = kn.laydata("SELECT * FROM sach");
            GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int masach = int.Parse(e.NewValues["masach"].ToString());
            string tensach = e.NewValues["tensach"].ToString();
            string tacgia = e.NewValues["tentg"].ToString();
            string strngayxb = e.NewValues["ngaysx"].ToString();
            string nhaxb = e.NewValues["nhaxb"].ToString();
            string hinh = e.NewValues["hinh"].ToString();
            string tinhtrang = e.NewValues["tinhtrang"].ToString();
            string mota = e.NewValues["mota"].ToString();
            string soluong = e.NewValues["soluong"].ToString();
            string maloai = e.NewValues["maloai"].ToString();
            string sql = "update sach set tensach = '" + tensach + "', tentg = N'" + tacgia + "', ngaysx = '" + strngayxb + "', nhaxb = N'" + nhaxb
                + "' , hinh = N'" + hinh + "' , tinhtrang = '" + tinhtrang + "' , mota = N'" + mota + "', soluong = '" + soluong + "', maloai = '" + maloai + "' where masach='" + masach + "'";
            int kq = kn.xuly(sql);

            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView1.DataSource = kn.laydata("SELECT * FROM sach");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }
        }
    }
}