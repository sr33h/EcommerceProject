using System;
using System.Data.SqlClient;
using BLL;

namespace EcommerceProject
{
    public partial class ProductViewPage : System.Web.UI.Page
    {
        ProductClass product = new ProductClass();
        CartClass cart = new CartClass();
        string stockOfProductLeftInInventory;
        int quantityOfProductInCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Session["userid"]);
            int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
            Label3.Text = $"({itemsInCart})";
            int productid = Convert.ToInt32(Session["productid"]);
            quantityOfProductInCart = cart.GetQuantityOfProductInCart(customerid, productid);
            QuantityInCart.Text = quantityOfProductInCart.ToString();
            SqlDataReader productDetails = product.GetProductDetailsAndStock(productid);
            while (productDetails.Read())
            {
                ProductName.Text = productDetails["ProductName"].ToString();
                Price.Text = productDetails["ProductPrice"].ToString();
                ProductDescription.Text = productDetails["ProductDescription"].ToString();
                stockOfProductLeftInInventory = productDetails["Stock"].ToString();
                ItemsLeftInStock.Text = stockOfProductLeftInInventory;
                Image1.ImageUrl = productDetails["ProductImage"].ToString();
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int productid = Convert.ToInt32(Session["productid"]);
            int customerid = Convert.ToInt32(Session["userid"]);
            int stockOfProductLeftInInventoryInt = Convert.ToInt32(stockOfProductLeftInInventory);
            if (quantityOfProductInCart >= stockOfProductLeftInInventoryInt)
            {
                Label5.Visible = true;
                Label6.Visible = true;
                HyperLink2.Visible = true;
            }
            else
            {
                cart.AddProductToCart(customerid, productid);
                int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
                Label3.Text = $"({itemsInCart})";
                quantityOfProductInCart = cart.GetQuantityOfProductInCart(customerid, productid);
                QuantityInCart.Text = quantityOfProductInCart.ToString();

            }           

        }
    }
}