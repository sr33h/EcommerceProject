using System;
using System.Data;
using System.Web.UI.WebControls;
using BLL;

namespace EcommerceProject
{
    public partial class LoggedInLandingPage : System.Web.UI.Page
    {
        CategoryClass categoryClass = new CategoryClass();
        CartClass cart = new CartClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet categoryDataset = categoryClass.getAllCategories();
                DataList1.DataSource = categoryDataset;
                DataList1.DataBind();
                int customerid = Convert.ToInt32(Session["userid"]);
                int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
                Label3.Text = $"({itemsInCart})";
            }
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
          Session["categoryId"] = e.CommandArgument;
          Response.Redirect("CategoryProductsPage.aspx");
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

    }
}