using System;
using System.Data;
using BLL;
using System.Web.UI.WebControls;

namespace EcommerceProject
{
    public partial class CategoryProductsPage : System.Web.UI.Page
    {
        ProductClass productClass = new ProductClass();
        CategoryClass categoryClass = new CategoryClass();
        CartClass cart = new CartClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int customerid = Convert.ToInt32(Session["userid"]);
                int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
                Label3.Text = $"({itemsInCart})";
                int categoryId = Convert.ToInt32(Session["categoryId"]);
                string categoryName = categoryClass.GetCategoryName(categoryId);
                Label1.Text = categoryName;
                DataSet productDataset = productClass.FetchProductsByCategory(categoryId);
                DataList1.DataSource = productDataset;
                DataList1.DataBind();
            }     
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            int productid = Convert.ToInt32(e.CommandArgument);
            int customerid = Convert.ToInt32(Session["userid"]);
            cart.AddProductToCart(customerid,productid);
            int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
            Label3.Text = $"({itemsInCart})";
        }

        protected void Button2_Command(object sender, CommandEventArgs e)
        {
            int productid = Convert.ToInt32(e.CommandArgument);
            Session["productid"] = productid;
            Response.Redirect("ProductViewPage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int productid = Convert.ToInt32(e.CommandArgument);
            Session["productid"] = productid;
            Response.Redirect("ProductViewPage.aspx");
        }
    }
}