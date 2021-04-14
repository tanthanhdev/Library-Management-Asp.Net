<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="QLTV.TinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="TinTuc.css" rel="stylesheet" />
    <style type="text/css">
        .sapo {
            display: block;
            font-size: 20px;
            font-weight: bold;
        }
        .sapo2 {
            display: block;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dtlTinTuc" runat="server">

    </asp:DataList>
    <div class="content-tieude">
        <asp:Label ID="txttieude" CssClass="article-title" Text="Thủ tướng phê duyệt chủ trương thành lập Trường ĐH Y Dược" runat="server" />
        <br />
        <asp:Label ID="txtdatetime"  CssClass="date-time" Text="12/4/2021 12:00:00 AM" runat="server" />
    </div>
    <div class="content-detail">
        <div class="main-content-body">
            <asp:Label ID="txtsabo" CssClass="sapo" Text="TTO - Thủ tướng Chính phủ vừa ký Quyết định 448/QĐ-TTg về việc phê duyệt chủ trương thành lập Trường Đại học Y Dược là trường đại học thành viên của Đại học Quốc gia Hà Nội." runat="server" />
            <div class="content fck" id="main-detail-body">
                <div class="VCSortableInPreviewMode active" typeof="Photo">
                    <div>
                        <a href="./image/tintuc/tintuc1_1920x2560.png" title="Toà nhà chính Đại học Quốc gia Hà Nội - Ảnh: QUANG THẾ" data-fancybox-group="img-lightbox" target="_blank" class="detail-img-lightbox">
                            <img src="./image/tintuc/tintuc1.png" alt="Thủ tướng phê duyệt chủ trương thành lập Trường ĐH Y Dược - Ảnh 1." id="img_7cf0" typeof="photo" style="max-width:100%;" data-original="./image/tintuc/tintuc1_1920x2560.png" 
                                class="lightbox-content" />
                        </a>
                    </div>
                    <div class="PhotoCMS_Caption ck_legend caption">
                        <asp:Label ID="txtchuthich" Text="Toà nhà chính Đại học Quốc gia Hà Nội - Ảnh: QUANG THẾ" runat="server" />
                    </div>
                </div>
                <p>
                    <asp:Label ID="txtnoidung" Text="Thủ tướng Chính phủ giao Bộ Giáo dục và Đào tạo chủ trì, phối hợp với các bộ, cơ quan liên quan tổ chức thẩm định hồ sơ, thẩm định thực tế đề án thành lập trường Đại học Y Dược là trường đại học thành viên của Đại học Quốc gia Hà Nội, địa chỉ tại số 144 đường Xuân Thuỷ, quận Cầu Giấy, Hà Nội.  Trường Đại học Y Dược phải được thành lập theo quy định của pháp luật về điều kiện đầu tư, hoạt động trong lĩnh vực giáo dục và các quy định pháp luật có liên quan trình Thủ tướng Chính phủ xem xét, quyết định.  Được biết tháng 1-2020, Giám đốc trường Đại học Quốc gia Hà Nội đã hoàn thiện đề án thành lập Trường Đại học Y Dược trình Thủ tướng Chính phủ.   Trước đó thành viên hội đồng Đại học Quốc gia Hà Nội tán thành việc thành lập Trường Đại học Y Dược.  Sau khi trao đổi, thảo luận, hội đồng tiến hành bỏ phiếu. Kết quả 19/19 thành viên hội đồng (100%) đồng ý việc thành lập Trường Đại học Y Dược trên cơ sở nâng cấp Khoa Y Dược.  Theo Đại học Quốc gia Hà Nội, đại học này đang triển khai 126 chương trình đào tạo đại học, 131 chương trình đào tạo thạc sĩ và 107 chương trình đào tạo tiến sĩ thuộc lĩnh vực khoa học tự nhiên, công nghệ, khoa học xã hội nhân văn, kinh tế, giáo dục, ngoại ngữ…" runat="server" />
                </p>
            </div>
        </div>
    </div>
</asp:Content>
