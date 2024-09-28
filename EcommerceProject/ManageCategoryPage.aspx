<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ManageCategoryPage.aspx.cs" Inherits="EcommerceProject.EditCategoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 71px;
        }
        .auto-style2 {
            height: 71px;
            text-align: center;
            width: 1050px;
        }
        .auto-style3 {
            width: 1050px;
        }
        .auto-style4 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style5 {
            width: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="False" Text="Manage Product Categories" Font-Names="Corbel Light"></asp:Label>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#B95A2D" NavigateUrl="~/SellerInventoryPage.aspx">&lt;&lt;Back to Inventory </asp:HyperLink>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table class="w-100">
        <tr>
            <td>
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>
    <asp:DataList ID="DataList1" runat="server" CellSpacing="10" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <table cellpadding="3" cellspacing="5" class="auto-style4">
                <tr>
                    <td class="text-center">
                        <asp:Image ID="Image1" runat="server" Height="182px" ImageUrl='<%# Eval("CategoryImage") %>' Width="211px" />
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("CategoryID") %>' OnCommand="Button1_Command" Text="EDIT" Width="150px" />
                        &nbsp; </td>
                </tr>
                <tr>
                    <td class="text-center">&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    </asp:Content>
