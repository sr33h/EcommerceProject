<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CategoryProductsPage.aspx.cs" Inherits="EcommerceProject.CategoryProductsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 384px;
        }
        .auto-style2 {
            width: 38px;
        }
        .auto-style3 {
            width: 452px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">
                <asp:DataList ID="DataList1" runat="server" CellPadding="5" CellSpacing="25" GridLines="Both" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <table cellspacing="5" class="auto-style1">
                            <tr>
                                <td class="text-left">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ProductID") %>' Height="259px" ImageUrl='<%# Eval("ProductImage") %>' OnCommand="ImageButton1_Command" Width="291px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                                    <asp:Button ID="Button2" runat="server" BackColor="White" BorderStyle="None" CommandArgument='<%# Eval("ProductID") %>' OnCommand="Button2_Command" Text='<%# Eval("ProductName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">Rs.<asp:Label ID="Label3" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                                    <asp:Button ID="Button1" runat="server" Font-Names="Arial" Font-Size="Medium" Text="ADD TO CART" CommandArgument='<%# Eval("ProductID") %>' OnCommand="Button1_Command" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <div class="text-center">
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
     <asp:Label ID="Label3" runat="server" Text="( 0 )"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:Button ID="Button1" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button1_Click" Text="Log Out" />
</asp:Content>

