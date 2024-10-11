<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CustomerOrdersPage.aspx.cs" Inherits="EcommerceProject.CustomerOrdersPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 97px;
        }
        .auto-style2 {
            text-align: center;
            height: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Label ID="Label3" runat="server" Text="( 0 )"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Button ID="Button3" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button3_Click" Text="Log Out" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1">
                <br />
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="XX-Large" ForeColor="#634E3D" Text="YOUR ORDERS"></asp:Label>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:DataList ID="DataList1" runat="server" Width="100%" BorderColor="Black" CellSpacing="10" GridLines="Horizontal">
                    <ItemTemplate>
                        <table class="w-100">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="200px" />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    <br />
                                    Rs.<asp:Label ID="Label5" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                                    &nbsp;/-</td>
                                <td>Qty : x<asp:Label ID="Label3" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </td>
                                <td>
                                    Delivery Address :<br />
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CustomerAddress") %>'></asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>Status :
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("OrderStatus") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
