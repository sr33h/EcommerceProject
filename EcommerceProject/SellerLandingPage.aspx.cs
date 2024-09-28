using System;
using BLL;

namespace EcommerceProject
{
    public partial class SellerLandingPage : System.Web.UI.Page
    {
        SellerDetails sellerDetails = new SellerDetails();
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid;

            if (Session["userid"]!=null)
            {
                userid = Convert.ToInt32(Session["userid"]);
                string sellerName = sellerDetails.GetSellerName(userid);                
                    Label1.Text = sellerName;                
            }
            else
            {
                Response.Redirect("LandingPage.aspx");
            }                
        }
    }
}