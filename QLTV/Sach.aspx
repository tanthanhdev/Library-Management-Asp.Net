<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Sach.aspx.cs" Inherits="QLTV.Sach1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
            <ItemTemplate>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">
                            <asp:LinkButton ID="LinkButton1" CssClass="hinhanh" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("masach") %>'>
                                <asp:Image ID="Image1" runat="server" Height="165px" ImageUrl='<%# "~/images/"+Eval("hinh") %>'  Width="165px" />
                            </asp:LinkButton>                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" CssClass="tensach" runat="server" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("masach") %>'>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("tensach") %>'></asp:Label>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    
                </table>
            </ItemTemplate>
        </asp:DataList>
</asp:Content>
