<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CustomerFeedbackPage.aspx.cs" Inherits="EcommerceProject.CustomerFeedbackPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Label ID="Label3" runat="server" Text="( 0 )"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <asp:Button ID="Button1" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button1_Click" Text="Log Out" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" ForeColor="#493932" Text="Send Feedback on your Completed Orders"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <div class="text-center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="5" DataKeyNames="OrderID" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="100%">
            <Columns>
                <asp:ImageField DataImageUrlField="ProductImage" HeaderText="Product Image">
                    <ItemStyle Height="200px" Width="200px" />
                </asp:ImageField>
                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                <asp:BoundField DataField="SellerName" HeaderText="Seller" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:CommandField SelectText="Send Feedback" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <br />
</asp:Content>
