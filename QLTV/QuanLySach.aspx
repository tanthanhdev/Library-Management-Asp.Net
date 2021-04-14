<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLyApp.Master" AutoEventWireup="true" CodeBehind="QuanLySach.aspx.cs" Inherits="QLTV.QuanLySach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="Filter">
            <asp:Label ID="Label2" runat="server" Text="Chọn thể loại"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="0">ALL</asp:ListItem>
                <asp:ListItem Value="1">CNTT</asp:ListItem>
                <asp:ListItem Value="2">DTVT</asp:ListItem>
                <asp:ListItem Value="3">QTKD</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="Lọc theo trạng thái: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True"
                >
                <asp:ListItem Value="0">All</asp:ListItem>
                <asp:ListItem Value="1">Mở</asp:ListItem>
                <asp:ListItem Value="2">Khóa</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <br />
        <div class="table" width:"100%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="masach" DataSourceID="QLTV" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Mã sách" SortExpression="masach">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("masach") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmasach" runat="server" Width="42px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("masach") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên sách" SortExpression="tensach">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tensach") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttensach" runat="server" Width="199px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("tensach") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên tác giả" SortExpression="tentg">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tentg") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttentg" runat="server" Width="164px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("tentg") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ngaysx" SortExpression="ngaysx">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ngaysx") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtngayxb" runat="server" Width="144px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ngaysx") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="nhaxb" SortExpression="nhaxb">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nhaxb") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnhaxb" runat="server" Width="141px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nhaxb") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hình ảnh">
                        <FooterTemplate>
                            <asp:TextBox ID="txthinh" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Images1" ImageUrl='<%#"~/images/"+Eval("Hinh") %>' runat="server" Width="100px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox" runat="server" Text='<%# Bind("hinh") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tinhtrang" SortExpression="tinhtrang">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("tinhtrang") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttinhtrang" runat="server" Width="84px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("tinhtrang") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mô tả">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("mota") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmota" runat="server" Width="206px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("mota") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("soluong") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtsoluong" runat="server" Width="89px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("soluong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loại sách">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("maloai") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtloaisach" runat="server" Width="69px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("maloai") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnthem" runat="server" Text="Thêm mới" OnClick="btnthem_Click" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                </Columns>
            </asp:GridView>
       
        </div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save" />
        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
</asp:Content>
