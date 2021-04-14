<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="QLTV.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .about{
            text-decoration: none;
            display: inline-block;
        }

        .sachmoi-img {
            height: 40px;
            width: 40px;
        }
        .sachmoi-label{
            font-weight: bold;
            color: deepskyblue;
        }

        h1 {
            text-transform: uppercase;
        }

        div.duongvien{
            width: 100%;
            height: 2px;
            background-color:black;
        }

        img.duytan {
            float: left;
        }


        .xemtiep {
            font-weight: bold;
            float: right;
            border-radius: 5px;
            background-color: cyan;
            margin-right: 200px;
        }

        .danhsachsach{
            width: 100%;
        }

        .auto-style2 {
            width: 100%;
        }
        td,input {
            font-family:Cambria;
            font-size:12px;
            text-align:center;
            padding:5px;
            margin:5px;
            vertical-align:top;
        }

        .tensach{
            text-decoration:none;
            font-size:18px;
        }

        .hinhanh {
            opacity:0.75;
        }

        .hinhanh:hover {
            opacity:1;
        }
        .auto-style3 {
            height: 23px;
            
        }

        .sach-image{
            border: 2px solid;
            box-shadow: rgba(0, 0, 0, 0.4)
        }

        .auto-style4 ul li{
            list-style: none;
            margin-right: 40px;
            position: relative;
        }

        .auto-style4 ul li,input{
            text-decoration: none;
            color: black;
            font-weight: bold;
            border: 2px solid;
            border-radius: 5px;
            text-transform: uppercase;
            font-family: Arial;
        }

        .auto-style4 ul li::after {
            content: '';
            height: 3px;
            width: 0%;
            background: cyan;
            position: absolute;
            left: 0;
            bottom: -10px;
            transition: 0.5s;
        }

        .auto-style4 ul li:hover::after {
            width: 100%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome!</h1>
    <div class="about">
        <img src="/images/dai-hoc-duy-tan.jpeg" alt="Alternate Text" class="duytan" width="450px" height="200px"/>
        <asp:Label ID="Label1" runat="server" Text="Tọa lạc giữa trung tâm thành phố Đà Nẵng, bên bờ biển Thái Bình Dương quanh năm đầy nắng ấm, Đại học Duy Tân đang từng ngày vươn lên cùng thành phố với khát vọng đổi mới theo hướng hiện đại. Đại học Duy Tân được thành lập từ ngày 11/11/1994 theo Quyết định Số 666/TTg của Thủ tướng Chính phủ. Năm 2015, Trường đã chuyển đổi sang loại hình Tư thục theo Quyết định số 1704/QĐ-TTg ngày 02/10/2015 của Thủ tướng Chính phủ. Duy Tân là Đại học Tư thục Đầu tiên và Lớn nhất miền Trung đào tạo đa bậc, đa ngành, đa lĩnh vực."></asp:Label>
        <br />
        <asp:Button ID="btnXemTiep" runat="server" Text="Xem Tiếp" CssClass="xemtiep" OnClick="btnXemTiep_Click1" />
    </div>
    <br />
    <br />
    <div class="duongvien"></div>
    <br />
    <div class="sachmoi">
        <img src="/images/book.png" alt="Alternate Text" class="sachmoi-img"/>
        <asp:Label ID="Label2" Text="Sách mới" runat="server" CssClass="sachmoi-label"/>
    </div>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CssClass="danhsachsach">
            <ItemTemplate>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">
                            <asp:LinkButton ID="LinkButton1" CssClass="hinhanh" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("masach") %>'>
                                <asp:Image ID="Image1" runat="server" Height="165px" ImageUrl='<%# "~/images/"+Eval("hinh") %>'  Width="165px"  CssClass="sach-image"/>
                            </asp:LinkButton>                          
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:LinkButton ID="LinkButton2" CssClass="tensach" runat="server" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("masach") %>'>
                                <ul>
                                    <li>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("tensach") %>' CssClass="tensach-label"></asp:Label>
                                    </li>
                                </ul>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
</asp:Content>
