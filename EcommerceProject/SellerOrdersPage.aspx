<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="SellerOrdersPage.aspx.cs" Inherits="EcommerceProject.SellerOrdersPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1">
                <br />
            </td>
            <td class="auto-style1"></td>
            <td class="text-center">
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
                <asp:DataList ID="DataList1" runat="server" BorderColor="Black" CellSpacing="10" DataKeyField="OrderID" GridLines="Horizontal" Width="100%">
                    <ItemTemplate>
                        <table class="w-100">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="200px" />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    <br />
                                    Rs.<asp:Label ID="Label5" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                                    &nbsp;/-<br /><asp:Label ID="Label7" runat="server" Text='<%# Eval("OrderID") %>' Visible="<%# false %>"></asp:Label>
                                </td>
                                <td>Qty : x<asp:Label ID="Label3" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </td>
                                <td>DeliveryAddress :
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CustomerAddress") %>'></asp:Label>
                                </td>
                                <td></td>
                                <td>Status:
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("OrderStatus") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" CommandArgument="OrderID" OnClick="Button2_Click" Text="Update Status" />
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
