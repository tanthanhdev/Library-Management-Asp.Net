using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV
{
    public partial class QuanLyNguoiDung : System.Web.UI.Page
    {
        ketnoi kn = new ketnoi();//khởi tạo kết nối
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["IdAdmin"] == null) Response.Redirect("LoginAdmin.aspx");
            if (IsPostBack == false)
            {
                //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                string sql = "SELECT * FROM nguoidung";
                GridView2.DataSource = kn.laydata(sql);
                GridView2.DataBind();//load dữ liêu lên đối tượng
            }
        }

        protected void btnAddNew_Click(object sender, ImageClickEventArgs e)
        {
            TextBox txtidfooter = (TextBox)GridView2.FooterRow.FindControl("txtidfooter");
            TextBox txttaikhoanfooter = (TextBox)GridView2.FooterRow.FindControl("txttaikhoanfooter");
            TextBox txtmatkhaufooter = (TextBox)GridView2.FooterRow.FindControl("txtmatkhaufooter");
            TextBox txttenfooter = (TextBox)GridView2.FooterRow.FindControl("txttenfooter");
            TextBox txtquyenfooter = (TextBox)GridView2.FooterRow.FindControl("txtquyenfooter");
            TextBox txtkhoafooter = (TextBox)GridView2.FooterRow.FindControl("txtkhoafooter");
            TextBox txtphaifooter = (TextBox)GridView2.FooterRow.FindControl("txtphaifooter");
            TextBox txtdiachifooter = (TextBox)GridView2.FooterRow.FindControl("txtdiachifooter");
            TextBox txtsdtfooter = (TextBox)GridView2.FooterRow.FindControl("txtsdtfooter");
            string Id = txtidfooter.Text;
            string taikhoan = txttaikhoanfooter.Text;
            string matkhau = txtmatkhaufooter.Text;
            string ten = txttenfooter.Text;
            string quyen = txtquyenfooter.Text;
            string khoa = txtkhoafooter.Text;
            string phai = txtphaifooter.Text;
            string diachi = txtdiachifooter.Text;
            string sdt = txtsdtfooter.Text;
            int kq = kn.xuly("insert into nguoidung(Id, taikhoan, ten, quyen, khoa) values ('" + Id + "' , '" + taikhoan 
                + "' , '" + matkhau + "' , N'" + ten + "' , '" + quyen + "' , '" + khoa + "' , '" + phai + "' , N'" + diachi 
                + "' , '" + sdt + "')");
            if (kq > 0) // neu cap nhat duoc thi hien thi khong bao
            {
                Response.Write("<script>alert('them moi thanh cong');</script>");
                GridView2.DataSource = kn.laydata("select * from nguoidung");
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('then moi khong thanh cong');</script>");
            }

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string Id = e.Values["Id"].ToString(); int kq = kn.xuly("delete from nguoidung where Id = " + Id);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thành công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM nguoidung");
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Xóa không thành công');</script>");
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridView2.DataSource = kn.laydata("SELECT * from nguoidung");
            GridView2.DataBind();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView2.DataSource = kn.laydata("SELECT * FROM nguoidung");
            GridView2.DataBind();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Id = e.NewValues["Id"].ToString();
            string taikhoan = e.NewValues["taikhoan"].ToString();
            string matkhau = e.NewValues["matkhau"].ToString();
            string ten = e.NewValues["ten"].ToString();
            string quyen = e.NewValues["quyen"].ToString();
            string khoa = e.NewValues["khoa"].ToString();
            string phai = e.NewValues["phai"].ToString();
            string diachi = e.NewValues["diachi"].ToString();
            string sdt = e.NewValues["sdt"].ToString();
            int kq = kn.xuly("update nguoidung set Id = '" + Id + "', taikhoan = '" + taikhoan
                + "' , matkhau = '" + matkhau + "' , ten = N'" + ten + "' , quyen = '" + quyen + "' , khoa = '" + khoa 
                + "' , phai = '" + phai + "' , diachi = N'" + diachi + "' , sdt = '" + sdt + "' where Id='" + Id + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thành công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM nguoidung");
                GridView2.EditIndex = -1;
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thành công');</script>");
            }

        }

    }
}