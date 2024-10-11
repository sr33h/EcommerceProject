﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="ViewFeedbackPage.aspx.cs" Inherits="EcommerceProject.ViewFeedbackPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 76px;
        }
        .auto-style2 {
            width: 100%;
            height: 536px;
        }
        .auto-style3 {
            width: 80%;
            background-color: #E4E4E4;
        }
        .auto-style4 {
            text-align: center;
            height: 32px;
        }
        .auto-style5 {
            width: 528px;
        }
        .auto-style6 {
            text-align: center;
            height: 285px;
        }
        .auto-style7 {
            text-align: center;
            height: 41px;
        }
        .auto-style8 {
            width: 80%;
            height: 408px;
            background-color: #E4E4E4;
        }
        .back-color-green{
            background-color : #00ff21;
        }
        .auto-style9 {
            text-align: center;
            height: 81px;
        }
        .auto-style10 {
            text-align: center;
            height: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="X-Large" Text="Reply to your Customer Feedback"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style2">
        <tr>
            <td class="auto-style5">
                <table align="center" class="auto-style3">
                    <tr>
                        <td class="text-center">
                            <br />
                            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <asp:Label ID="Label5" runat="server" Text="Product Name : "></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label6" runat="server" Text="Price : Rs."></asp:Label>
                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <asp:Label ID="Label7" runat="server" Text="Quantity : x"></asp:Label>
                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <asp:Label ID="Label8" runat="server" Text="Customer : "></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table align="center" class="auto-style8">
                    <tr>
                        <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label15" runat="server" Text="Customer Feedback : "></asp:Label>
                            <br />
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Italic="True" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="Label13" runat="server" Text="Type your Reply here"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Height="162px" MaxLength="250" TextMode="MultiLine" Width="80%"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" ForeColor="Red" Text="Max length of 250 characters exceeded." Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Button ID="Button2" runat="server" BackColor="#F9ECE6" Font-Bold="True" Font-Names="Arial" Height="47px" OnClick="Button2_Click" Text="Send Reply" Width="182px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/SellerFeedbackPage.aspx">&lt;&lt;Back to Delivered Orders</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>