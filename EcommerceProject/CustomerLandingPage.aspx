<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CustomerLandingPage.aspx.cs" Inherits="EcommerceProject.LoggedInLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="shop_section layout_padding">
          <div class="container">
              <div class="text-left">
                  <table class="w-100">
                      <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td class="text-center">
                              <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Corbel" Font-Size="XX-Large" ForeColor="#454545" Text="CATEGORIES"></asp:Label>
                              <br />
                          </td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                      </tr>
                  </table>
                  <table class="w-100">
                      <tr>
                          <td class="auto-style1">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td class="text-center">
        <asp:DataList ID="DataList1" runat="server" CellPadding="5" CellSpacing="10" RepeatColumns="4" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" BorderWidth="1px" Width="100%">
            <ItemTemplate>
                <table class="w-100" align="center">
                    <tr>
                        <td class="text-center">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("CategoryID") %>' Height="206px" ImageUrl='<%# Eval("CategoryImage") %>' OnCommand="ImageButton1_Command" Width="221px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Text='<%# Eval("CategoryName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">
                            &nbsp;</td>
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
                  <table class="w-100">
                      <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td class="text-center">
                              <br />
                          </td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                      </tr>
                  </table>
                  <br />
        
        </div>
        
   </div>

  </section>

  <!-- end shop section -->
      
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">

    <asp:Button ID="Button1" runat="server" BackColor="#F9ECE6" BorderStyle="None" OnClick="Button1_Click" Text="Log Out" />

</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <asp:Label ID="Label3" runat="server" Text="( 0 )"></asp:Label>
</asp:Content>


