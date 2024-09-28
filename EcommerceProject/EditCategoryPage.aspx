<%@ Page Title="" Language="C#" MasterPageFile="~/Seller.Master" AutoEventWireup="true" CodeBehind="EditCategoryPage.aspx.cs" Inherits="EcommerceProject.EditCategoryPage1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 214px;
        }
        .auto-style5 {
            width: 214px;
            height: 32px;
        }
        .auto-style6 {
            height: 32px;
        }
        .auto-style7 {
            width: 318px;
        }
        .auto-style8 {
            width: 318px;
            height: 32px;
        }
        .auto-style9 {
            width: 455px;
        }
        .auto-style10 {
            width: 455px;
            height: 32px;
        }
        .auto-style11 {
            width: 318px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Corbel Light" Font-Size="XX-Large" ForeColor="#181818" Text="Edit Category"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td class="text-center">
                <asp:Image ID="Image1" runat="server" Height="197px" Width="217px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="w-100">
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style5"></td>
            <td class="auto-style8"></td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Text="Category Name"></asp:Label>
                <br />
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name cannot be empty" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Text="Category Description"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Description cannot be empty." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style5">
                <asp:Label ID="Label4" runat="server" Text="Category Image"></asp:Label>
                <br />
            </td>
            <td class="auto-style8">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3">
                <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3">
                <asp:Button ID="Button1" runat="server" BackColor="#006600" Font-Bold="True" ForeColor="White" OnClick="Button1_Click" Text="UPDATE" Width="200px" />
            </td>
            <td class="auto-style11">
                <asp:Button ID="Button3" runat="server" BackColor="#FF9933" CausesValidation="False" Font-Bold="True" ForeColor="White" OnClick="Button3_Click" Text="CANCEL" Width="200px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
