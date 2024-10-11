<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="EcommerceProject.LandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 78px;
        }
        .auto-style2 {
            text-align: center;
            height: 36px;
        }
        .auto-style3 {
            height: 64px;
        }
        .auto-style4 {
            height: 64px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#595757" Text="LATEST PRODUCTS"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:DataList ID="DataList1" runat="server" CellSpacing="10" RepeatColumns="3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" Width="100%">
        <ItemTemplate>
            <table class="w-100">
                <tr>
                    <td class="text-center">
                        <asp:Image ID="Image1" runat="server" Height="300px" ImageUrl='<%# Eval("ProductImage") %>' Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">Rs.
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("ProductPrice") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
    <table class="w-100">
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                <asp:Button ID="Button1" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" Text="Login to Buy/Sell Gifts" />
            </td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
    </table>
    <br />
   
</asp:Content>
