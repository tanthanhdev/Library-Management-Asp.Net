using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV
{
    public partial class QuanLyTinTuc : System.Web.UI.Page
    {
        
        ketnoi kn = new ketnoi();//khởi tạo kết nối
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["IdAdmin"] == null) Response.Redirect("LoginAdmin.aspx");
            if (IsPostBack == false)
            {
                //Gán chuỗi kết nối cho dataSoure của Control(GridView1)
                string sql = "SELECT * FROM tintuc";
                GridView2.DataSource = kn.laydata(sql);
                GridView2.DataBind();//load dữ liêu lên đối tượng
            }
        }

        protected void btnAddNew_Click(object sender, ImageClickEventArgs e)
        {
            TextBox txtmatintucfooter = (TextBox)GridView2.FooterRow.FindControl("txtmatintucfooter");
            TextBox txttieudefooter = (TextBox)GridView2.FooterRow.FindControl("txttieudefooter");
            TextBox txtngaydangfooter = (TextBox)GridView2.FooterRow.FindControl("txtngaydangfooter");
            TextBox txttrangthaifooter = (TextBox)GridView2.FooterRow.FindControl("txttrangthaifooter");
            TextBox txthinhfooter = (TextBox)GridView2.FooterRow.FindControl("txthinhfooter");
            TextBox txtnoidungfooter = (TextBox)GridView2.FooterRow.FindControl("txtnoidungfooter");
            string matintuc = txtmatintucfooter.Text;
            string tieude = txttieudefooter.Text;
            string ngaydang = txtngaydangfooter.Text;
            string trangthai = txttrangthaifooter.Text;
            string hinh = txthinhfooter.Text;
            string noidung = txtmatintucfooter.Text;
            int kq = kn.xuly("insert into tintuc values ('" + matintuc + "' , N'" + tieude + "' , N'" + hinh + "' , '" + ngaydang + "' , '" + trangthai + "' , N'" + noidung + "')");
            if (kq > 0) // neu cap nhat duoc thi hien thi khong bao
            {
                Response.Write("<script>alert('them moi thanh cong');</script>");
                GridView2.DataSource = kn.laydata("select * from tintuc");
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('then moi khong thanh cong');</script>");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            if (FileUpload1.HasFile)
            {
                try
                {
                    sb.AppendFormat(" Uploading file: {0}", FileUpload1.FileName);

                    //saving the file
                    string fileName = "images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                    string filePath = MapPath(fileName);

                    //CHÚ Ý SỬA LẠI ĐƯỜNG DẪN FOLDER THEO ĐÚNG MÁY CHỦ ĐANG CHẠY
                    FileUpload1.SaveAs(filePath);

                    //push to textbox hinh in gridview2
                    TextBox txthinhfooter = (TextBox)GridView2.FooterRow.FindControl("txthinhfooter");
                    txthinhfooter.Text = FileUpload1.FileName;

                    //Showing the file information
                    sb.AppendFormat("<br/> Save As: {0}", FileUpload1.PostedFile.FileName);
                    sb.AppendFormat("<br/> File type: {0}", FileUpload1.PostedFile.ContentType);
                    sb.AppendFormat("<br/> File length: {0}", FileUpload1.PostedFile.ContentLength);
                    sb.AppendFormat("<br/> File name: {0}", FileUpload1.PostedFile.FileName);
                    lblmessage.Text = sb.ToString();
                }
                catch (Exception ex)
                {
                    sb.Append("<br/> Error <br/>");
                    sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
                    lblmessage.Text = sb.ToString();
                }
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string matintuc = e.Values["matintuc"].ToString(); int kq = kn.xuly("delete from tintuc where matintuc = " + matintuc);
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Xóa thành công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM tintuc");
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
            GridView2.DataSource = kn.laydata("SELECT * from tintuc");
            GridView2.DataBind();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;//không lấy giá trị cột nào hết
            GridView2.DataSource = kn.laydata("SELECT * FROM tintuc");
            GridView2.DataBind();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string matintuc = e.NewValues["matintuc"].ToString();
            string tieude = e.NewValues["tieude"].ToString();
            string hinh = e.NewValues["hinh"].ToString();
            string ngaydang = e.NewValues["ngaydang"].ToString();
            string trangthai = e.NewValues["trangthai"].ToString();
            string noidung = e.NewValues["noidung"].ToString();
            int kq = kn.xuly("update tintuc set matintuc = '" + matintuc + "', tieude = N'" + tieude
                + "' , hinh = '" + hinh + "' , ngaydang = '" + ngaydang + "' , trangthai = '" + trangthai 
                + "', noidung = N'" + noidung + "' where matintuc='" + matintuc + "'");
            if (kq > 0)//neu cap nhat duoc thi hien thong bao
            {
                Response.Write("<script>alert('Cập nhật thanh công');</script>");
                GridView2.DataSource = kn.laydata("SELECT * FROM tintuc");
                GridView2.EditIndex = -1;
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Cập nhật không thanh công');</script>");
            }

        }
    }
}