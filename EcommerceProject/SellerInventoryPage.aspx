<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="SellerInventoryPage.aspx.cs" Inherits="EcommerceProject.SellerInventoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 252px;
        }
        .auto-style29 {
            width: 721px;
        }
        .auto-style30 {
            width: 84px;
            height: 302px;
        }
        .auto-style33 {
            margin-right: 0px;
        }
        .auto-style36 {
            width: 201px;
            height: 302px;
        }
        .auto-style38 {
            width: 95px;
            height: 302px;
        }
        .auto-style39 {
            width: 116px;
            height: 302px;
        }
        .auto-style40 {
            width: 5px;
            height: 302px;
        }
        .auto-style41 {
            width: 87px;
            height: 302px;
        }
        .auto-style54 {
            width: 80%;
        }
        .auto-style55 {
            width: 165px;
        }
        .auto-style56 {
            width: 326px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td class="text-center">
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Corbel Light" Font-Size="XX-Large" ForeColor="#464444" Text="INVENTORY"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table align="center" class="auto-style54">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style56">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button5" runat="server" BackColor="#F7EAE4" BorderColor="#595757" BorderStyle="Solid" Font-Names="Arial" ForeColor="#595757" Height="50px" Text="MANAGE PRODUCTS" Width="250px" OnClick="Button5_Click" />
            </td>
            <td>&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" BorderColor="#595757" BorderStyle="Solid" Font-Bold="False" Font-Names="Arial" ForeColor="#595757" Height="50px" OnClick="Button2_Click" Text="+ADD PRODUCT" Width="250px" />
            </td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style56">
                <asp:Button ID="Button4" runat="server" BackColor="#F7EAE4" BorderColor="#595757" BorderStyle="Solid" Font-Names="Arial" ForeColor="#595757" Height="50px" OnClick="Button4_Click" Text="MANAGE CATEGORY" Width="320px" />
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="#F9ECE6" BorderColor="#595757" BorderStyle="Solid" Font-Bold="False" Font-Names="Arial" ForeColor="#595757" Height="50px" OnClick="Button1_Click" Text="+ADD CATEGORY" Width="250px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style56">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style29">
    <asp:DataList ID="DataList1" runat="server" CellPadding="10" CellSpacing="10" CssClass="auto-style33" GridLines="Both">
        <ItemTemplate>
            <table cellspacing="5" class="w-100">
                <tr>
                    <td class="auto-style36">
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="204px" />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                    <td class="auto-style40">
                    </td>
                    <td class="auto-style30"></td>
                    <td class="auto-style38">
                        Price :&nbsp;</td>
                    <td class="auto-style39">Rs.<asp:Label ID="Label3" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                    </td>
                    <td class="auto-style41">
                        Quantity :</td>
                    <td class="auto-style41">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
&nbsp;
    <br />
</asp:Content>
