<%@ Page Title="" Language="C#" MasterPageFile="~/CartMaster.Master" AutoEventWireup="true" CodeBehind="ViewOrderSummary.aspx.cs" Inherits="EcommerceProject.ViewOrderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 80px;
        }
        .auto-style4 {
            width: 395px;
            text-align: center;
        }
        .auto-style5 {
            width: 151px;
        }
        .auto-style7 {
            height: 47px;
        }
        .auto-style8 {
            height: 46px;
        }
        .auto-style9 {
            text-align: center;
            height: 46px;
        }
        .auto-style10 {
            height: 57px;
        }
        .auto-style11 {
            text-align: left;
            height: 57px;
        }
        .auto-style12 {
            text-align: center;
            height: 57px;
        }
        .auto-style13 {
            margin-left: 0px;
        }
        .auto-style14 {
            width: 200px;
        }
        .auto-style15 {
            width: 398px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button2_Click" Text="Log Out" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" Text="ORDER SUMMARY"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-left">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="Large" NavigateUrl="~/ViewCartPage.aspx">&lt;&lt; Back to Cart</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="Black" BorderStyle="None" BorderWidth="2px" Font-Names="Britannic Bold" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="ProductPrice" HeaderText="Price/pcs." />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    </Columns>
                </asp:GridView>
                <table class="w-100">
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Bodoni MT Black" Font-Size="Large" Text="Grand Total : "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Bodoni MT Black" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style15">
                <asp:Panel ID="Panel1" runat="server" BackColor="#E4E4E4" BorderStyle="Dashed" CssClass="auto-style13" Width="371px">
                    <table class="w-100">
                        <tr>
                            <td class="auto-style8"></td>
                            <td class="auto-style9" colspan="2">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="PAYMENT"></asp:Label>
                            </td>
                            <td class="auto-style8"></td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style7" colspan="2">&nbsp;&nbsp;
                                <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Enter your 16 digit debit card number "></asp:Label>
                            </td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="text-left" colspan="2">&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox6" runat="server" Width="260px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Invalid format. Enter 16 digits without any spaces." Font-Bold="True" Font-Size="X-Small" ForeColor="#CC0000" ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="text-left">&nbsp;&nbsp;
                                <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="CVV"></asp:Label>
                            </td>
                            <td class="text-center">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox5" runat="server" ValidationGroup="card" Width="50px"></asp:TextBox>
                                <br />
                                &nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter your 3 digit CVV" Font-Bold="True" Font-Size="X-Small" ForeColor="#CC0000" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style12">
                                <br />
                            </td>
                            <td class="auto-style10"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="text-center" colspan="2">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Text="Sorry. The provided card details are invalid. Please enter a valid card number." Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="RadioButton1" runat="server" Font-Size="Small" Text="Remember this card" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="text-center">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="text-center" colspan="2">
                                <asp:Button ID="Button3" runat="server" BackColor="Yellow" BorderStyle="None" Height="42px" OnClick="Button3_Click" Text="PAY NOW" Width="194px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
