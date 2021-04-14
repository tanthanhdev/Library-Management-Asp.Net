<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyApp.Master" AutoEventWireup="true" CodeBehind="QuanLyTinTuc.aspx.cs" Inherits="QLTV.QuanLyTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .grid-quanly{
            width: 100%;
        }

        .fileUpload{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div>
            <asp:GridView CssClass="grid-quanly" ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="True" ShowHeaderWhenEmpty="True"
                
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating">
                <%-- Theme Properties --%>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />


                <Columns>
                    <asp:TemplateField HeaderText="Mã Tin tức">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("matintuc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmatintucfooter" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmatintucfooter" Display="Dynamic" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("matintuc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tiêu đề">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tieude") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttieudefooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("tieude") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hình">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("hinh") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txthinhfooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Label2" runat="server" ImageURL='<%# "~/image/tintuc/" + Eval("hinh") %>' Width="100px" Height="80px"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày đăng">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ngaydang") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtngaydangfooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ngaydang") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Trạng thái">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("trangthai") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttrangthaifooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("trangthai") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nội dung">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("noidung") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnoidungfooter" runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("noidung") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/image/addnew.png" ID="btnAddNew" runat="server" Width="20px" Height="20px" OnClick="btnAddNew_Click" />

                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/image/edit.png" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Width="20px" Height="20px"></asp:ImageButton>
                            &nbsp;<asp:ImageButton ImageUrl="~/image/delete.png" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" Width="20px" Height="20px"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/image/save.png" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Update" Width="20px" Height="20px"></asp:ImageButton>
                            &nbsp;<asp:ImageButton ImageUrl="~/image/cancel.png" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Width="20px" Height="20px"></asp:ImageButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            
                
            </asp:GridView>
        <div class="fileUpload">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Thêm Mới" OnClick="Button1_Click" CausesValidation="False" />
            <br />
            <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
