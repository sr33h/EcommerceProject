<%@ Page Title="" Language="C#" MasterPageFile="~/CartMaster.Master" AutoEventWireup="true" CodeBehind="ViewCartPage.aspx.cs" Inherits="EcommerceProject.ViewCartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style2 {
            height: 89px;
        }
        .auto-style3 {
            text-align: center;
            height: 89px;
        }
        .auto-style4 {
            width: 100%;
            height: 102px;
        }
        .auto-style5 {
            width: 829px;
            text-align: right;
        }
        .auto-style6 {
            width: 654px;
            height: 22px;
        }
        .auto-style7 {
            text-align: right;
            width: 654px;
        }
        .auto-style8 {
            height: 22px;
        }
        .auto-style9 {
            height: 22px;
            text-align: right;
            width: 721px;
        }
        .auto-style10 {
            width: 721px;
        }
        .auto-style11 {
            width: 792px;
            height: 22px;
        }
        .auto-style12 {
            text-align: right;
            width: 792px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button2_Click" Text="Log Out" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table class="auto-style4">
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" ForeColor="#595757" Text="VIEW CART"></asp:Label>
            </td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="ProductID" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:ImageField DataImageUrlField="ProductImage" HeaderText="Image" ReadOnly="True">
                            <ControlStyle Height="200px" Width="200px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" ReadOnly="True" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="ProductPrice" HeaderText="Price( in Rs. )" ReadOnly="True" />
                        <asp:CommandField EditText="Update Quantity" ShowEditButton="True" />
                        <asp:CommandField DeleteText="X Remove From Cart" EditText="" ShowDeleteButton="True">
                        <ItemStyle ForeColor="Red" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" Text="ORDER TOTAL : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" Text="Rs. "></asp:Label>
                <asp:Label ID="OrderTotal" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td class="auto-style9">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/CustomerLandingPage.aspx">&lt;&lt;Back to Shopping</asp:HyperLink>
            </td>
            <td class="auto-style11"></td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style12">
                <asp:Button ID="Button3" runat="server" BackColor="#F9ECE6" Font-Size="Large" Height="48px" Text="VIEW SUMMARY" ForeColor="#554239" OnClick="Button3_Click" />
            </td>
            <td class="auto-style7">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
