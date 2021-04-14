using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLTV
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\QLTV.mdf;Integrated Security=True";
           
                if (Page.IsPostBack) return;
                string q;
                if (Context.Items["ml"] == null)
                {
                    q = "select * from sach";
                }
                else
                {
                    string maloai = Context.Items["ml"].ToString();
                    q = "select * from sach where maloai='" + maloai + "'";
                }

                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(q, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    this.DataList1.DataSource = dt;
                    this.DataList1.DataBind();
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
         }

        protected void btnXemTiep_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string masach = ((LinkButton)sender).CommandArgument;
            Context.Items["ms"] = masach;
            Server.Transfer("Sach.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string masach = ((LinkButton)sender).CommandArgument;
            Context.Items["ms"] = masach;
            Server.Transfer("Sach.aspx");
        }

        protected void btnXemTiep_Click1(object sender, EventArgs e)
        {
            Server.Transfer("TinTuc.aspx");
        }
    }
}