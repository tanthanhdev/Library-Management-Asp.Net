<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyApp.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="QLTV.LoginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .form-login {
            margin: 0 auto;
            margin-top: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" CssClass="form-login"></asp:Login>
</asp:Content>
