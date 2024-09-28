using System;
using BLL;

namespace EcommerceProject
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        UserRegistration userRegistration = new UserRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox5.Text;

            bool usernameAlreadyTaken = userRegistration.IsUsernameAlreadyTaken(username);

            if (usernameAlreadyTaken)
            {
                Label11.Text = "Username is already taken. Please choose a different username";
            }
            else
            {
                int rowsinserted = userRegistration.RegisterUserFunction(TextBox1.Text,TextBox2.Text,TextBox3.Text,TextBox4.Text,TextBox5.Text,TextBox6.Text,
                RadioButtonList1.SelectedValue);

                if (rowsinserted == 1)
                {
                    Response.Redirect("LoginPage.aspx");
                }
                else
                {
                    Label10.Text = "Unable to register at the moment. Please try again later.";
                }
            }           
        }
    }
}