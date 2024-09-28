using System;
using System.Data;
using BLL;
namespace EcommerceProject
{
    public partial class SellerInventoryPage : System.Web.UI.Page
    {
        SellerInventory sellerInventory = new SellerInventory();
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userid"]);
            DataSet productDataset = sellerInventory.FetchAllSellerProducts(userid);
            DataList1.DataSource = productDataset;
            DataList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategoryPage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewProductPage.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCategoryPage.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProductsPage.aspx");
        }
    }
}