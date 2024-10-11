<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="SellerOrderStatusUpdate.aspx.cs" Inherits="EcommerceProject.SellerOrderStatusUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 214px;
        }
        .auto-style2 {
            width: 282px;
        }
        .auto-style3 {
            width: 214px;
            height: 32px;
        }
        .auto-style4 {
            width: 282px;
            height: 32px;
        }
        .auto-style5 {
            height: 32px;
        }
        .auto-style6 {
            width: 405px;
        }
        .auto-style7 {
            text-align: center;
            width: 405px;
            height: 32px;
        }
        .auto-style9 {
            text-align: left;
            width: 405px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/SellerOrdersPage.aspx">&lt;&lt;Back to Orders</asp:HyperLink>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <br />
                <asp:Image ID="Image1" runat="server" Height="198px" Width="217px" />
            </td>
            <td class="auto-style9">Delivery Address :
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                Product Name :
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td class="auto-style6" rowspan="3">
                <asp:Label ID="Label6" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ship Order" Visible="False" BackColor="#F9ECE6" Font-Bold="True" Width="177px" />
                <br />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Deliver Order" Visible="False" BackColor="#F9ECE6" Font-Bold="True" Width="177px" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                Price : Rs.<asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                Quantity :
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                Order Status :
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
            <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
