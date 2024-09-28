<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ManageProductsPage.aspx.cs" Inherits="EcommerceProject.ManageProductsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 1px solid #000000;
        }
        .auto-style2 {
            width: 331px;
        }
        .auto-style3 {
            width: 273px;
        }
        .auto-style4 {
            width: 138px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Corbel Light" Font-Size="XX-Large" Font-Underline="False" Text="Manage Products" ForeColor="#454343"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td></td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#B95A2D" NavigateUrl="~/SellerInventoryPage.aspx">&lt;&lt;Back to Inventory </asp:HyperLink>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="Large" ForeColor="#181818" Text="Category : "></asp:Label>
&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="#F9ECE6" ForeColor="#454343" Height="40px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="200px">
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:Button ID="Button3" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" ForeColor="#0066FF" OnClick="Button3_Click" Text="View All" />
            </td>
        </tr>
    </table>
    <br />
    <div class="text-center">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <table cellpadding="5" cellspacing="10" class="auto-style1">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("ProductID") %>' OnCommand="Button2_Command" Text="EDIT" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
        <br />
    </div>
</asp:Content>
