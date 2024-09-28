<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="EcommerceProject.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style4 {
            width: 100%;
            margin-right: 0px;
        }
        .auto-style5 {
            height: 32px;
        }
        .auto-style21 {
            height: 32px;
            width: 150px;
        }
        .auto-style22 {
            width: 150px;
        }
        .auto-style29 {
            height: 32px;
            width: 213px;
        }
        .auto-style30 {
            width: 213px;
        }
        .auto-style35 {
            width: 150px;
            height: 92px;
        }
        .auto-style36 {
            width: 213px;
            height: 92px;
        }
        .auto-style37 {
            width: 390px;
            height: 92px;
        }
        .auto-style38 {
            height: 92px;
        }
        .auto-style43 {
            height: 32px;
            width: 390px;
        }
        .auto-style44 {
            width: 390px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Dashed" BorderColor="#666699" CssClass="auto-style1">
          <table class="auto-style4">
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style43">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
              <tr>
                  <td class="auto-style21">&nbsp;</td>
                  <td class="auto-style29">
                      <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="Large" Font-Underline="True" Text="User Registration"></asp:Label>
                  </td>
                  <td class="auto-style43">&nbsp;</td>
                  <td class="auto-style5">&nbsp;</td>
              </tr>
              <tr>
                  <td class="auto-style21"></td>
                  <td class="auto-style29"></td>
                  <td class="auto-style43"></td>
                  <td class="auto-style5"></td>
              </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                &nbsp;<asp:Label ID="Label1" runat="server" Font-Names="Arial" Text="Name : "></asp:Label>
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter your name." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21"></td>
            <td class="auto-style29">
                &nbsp;<asp:Label ID="Label2" runat="server" Font-Names="Arial" Text="E-mail : "></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style43">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter your email." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid format" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label3" runat="server" Font-Names="Arial" Text="Phone : "></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Phone"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid format." Font-Bold="True" Font-Size="X-Small" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter your phone number." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label4" runat="server" Font-Names="Arial" Text="Address : "></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter your delivery address." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label5" runat="server" Font-Names="Arial" Text="Username : "></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter a username." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label6" runat="server" Font-Names="Arial" Text="Password : "></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style44">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Please enter a password." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="Password should contain exatly 8 letters/digits." Font-Bold="True" Font-Size="X-Small" ForeColor="Red" ValidationExpression="\w{8}"></asp:RegularExpressionValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style35"></td>
            <td class="auto-style36">
                <br />
                <asp:Label ID="Label9" runat="server" Font-Names="Arial" Text="Confirm Password : "></asp:Label>
            </td>
            <td class="auto-style37">
                <br />
                <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" ErrorMessage="Re-entered password do not match." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:CompareValidator>
            </td>
            <td class="auto-style38"></td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label8" runat="server" Text="User Type : "></asp:Label>
            </td>
            <td class="auto-style44">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="333px">
                    <asp:ListItem>Seller</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Please select the type of user you are." Font-Bold="True" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">
                <br />
                <asp:Button ID="Button1" runat="server" BackColor="#B3D5AA" OnClick="Button1_Click" Text="Sign Up" Width="191px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">
                <br />
                <asp:Label ID="Label10" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
  

</asp:Content>
