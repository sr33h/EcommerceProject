using System;
using BLL;

namespace EcommerceProject
{
    public partial class LoginPage : System.Web.UI.Page
    {
        LoginClass loginClass = new LoginClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idFound = loginClass.LoginFunction(TextBox1.Text, TextBox2.Text);

            if(idFound == 1)
            {
                int userid = loginClass.GetUserID(TextBox1.Text, TextBox2.Text);
                Session["userid"] = userid;
                string logintype = loginClass.GetUserType(TextBox1.Text, TextBox2.Text);
                if (logintype == "Customer")
                {
                    Response.Redirect("CustomerLandingPage.aspx");
                }else if (logintype == "Seller")
                {
                    Response.Redirect("SellerLandingPage.aspx");
                }                
            }
            else
            {
                Label3.Text = "Invalid Username/Password";
            }            
        }
    }
}