<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="SellerFeedbackPage.aspx.cs" Inherits="EcommerceProject.SellerFeedbackPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 70px;
        }
        .auto-style2 {
            text-align: center;
            height: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" Text="View and Reply to Feedbacks from Customers"></asp:Label>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
    </table>
    <div class="text-center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="5" DataKeyNames="OrderID" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="100%">
            <Columns>
                <asp:ImageField DataImageUrlField="ProductImage" HeaderText="Product Image">
                    <ItemStyle Height="200px" Width="200px" />
                </asp:ImageField>
                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:CommandField SelectText="View Feedback" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <br />
</asp:Content>
