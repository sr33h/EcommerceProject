<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ProductViewPage.aspx.cs" Inherits="EcommerceProject.ProductViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 404px;
        }
        .auto-style2 {
            width: 100%;
            height: 487px;
        }
        .auto-style6 {
            width: 86%;
        }
        .auto-style9 {
            text-align: center;
            height: 266px;
            width: 438px;
        }
        .auto-style13 {
            height: 404px;
            width: 596px;
        }
        .auto-style14 {
            height: 404px;
            width: 420px;
        }
        .auto-style15 {
            width: 100%;
            height: 93px;
        }
        .auto-style16 {
            text-align: center;
            width: 1516px;
        }
        .auto-style17 {
            height: 359px;
            text-align: center;
            width: 1516px;
        }
        .auto-style18 {
            text-align: center;
            width: 1061px;
        }
        .auto-style19 {
            height: 359px;
            text-align: center;
            width: 1061px;
        }
        .auto-style20 {
            text-align: left;
            height: 87px;
            width: 438px;
        }
        .auto-style21 {
            text-align: left;
            height: 40px;
            width: 438px;
        }
        .auto-style22 {
            text-align: center;
            height: 40px;
            width: 438px;
        }
        .auto-style23 {
            text-align: left;
            width: 438px;
        }
        .auto-style24 {
            text-align: right;
            width: 438px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Label ID="Label3" runat="server" Text="( 0 )"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button2_Click" Text="Log Out" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style15">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                              <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="XX-Large" ForeColor="#454545">PRODUCT VIEW</asp:Label>
                              </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style13">
                <table class="auto-style6">
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style18">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style17">&nbsp;</td>
                        <td class="auto-style19">
                            <asp:Image ID="Image1" runat="server" Height="325px" OnDataBinding="Page_Load" Width="374px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style18">
                            <asp:Label ID="ProductName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style18">Rs.
                            <asp:Label ID="Price" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style18">&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td class="auto-style14">
                <table class="w-100">
                    <tr>
                        <td class="auto-style20">
                            <asp:Label ID="ProductDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Order Quantity* :
                            <asp:Label ID="QuantityInCart" runat="server"></asp:Label>
&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style21">
                            <br />
                            ( *<asp:Label ID="ItemsLeftInStock" runat="server" Font-Size="Small"></asp:Label>
&nbsp;<asp:Label ID="Label4" runat="server" Font-Size="Small" Text="items left in stock"></asp:Label>
&nbsp;)</td>
                    </tr>
                    <tr>
                        <td class="auto-style22">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red" Text="Not enough items in stock ! " Visible="False"></asp:Label>
                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Small" Visible="False" NavigateUrl="~/ViewCartPage.aspx">View Cart</asp:HyperLink>
&nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red" Text="  to modify quantity." Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Button ID="Button1" runat="server" Font-Names="Arial" Font-Size="Medium" Text="+ADD TO CART" CommandArgument='<%# Eval("ProductID") %>' OnClick="Button1_Click1" Height="70px" Width="210px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="Large" NavigateUrl="~/CustomerLandingPage.aspx">&lt;&lt;Back to Shopping</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
