<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="ChiTietSach.aspx.cs" Inherits="QLTV.ChiTietSach1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .data-list {
            padding: 20px;
            display:flex;
        }
        .detail {
            margin-left: 15px;
        }

        .tensach {
            font-size: 25px;
            font-weight: 500;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" >
            <ItemTemplate>
                <div class="data-list">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("hinh") %>' Height="200px" width="200px" />
                    <div class="detail">
                        <asp:Label ID="Label1" CssClass="tensach" runat="server" Text='<%# Eval("tensach") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Số lượng" ></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" Text="1"></asp:TextBox>
                        <br /><br />
                        <asp:Button ID="Button1" runat="server" Text="Mượn sách" CommandArgument='<%# Eval("masach") %>' OnClick="Button1_Click"/>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
</asp:Content>
