using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace EcommerceProject
{
    public partial class ManageProductsPage : System.Web.UI.Page
    {
        ProductClass product = new ProductClass();
        SellerInventory sellerInventory = new SellerInventory();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int sellerid = Convert.ToInt32(Session["userid"]);

                DataSet productDataset = product.FetchAllProductsFromSellerInventory(sellerid);
                DataList1.DataSource = productDataset;
                DataList1.DataBind();

                DataSet sellerCategories = sellerInventory.GetCategoriesOfSeller(sellerid);
                DropDownList1.DataSource = sellerCategories;
                DropDownList1.DataTextField = "CategoryName";
                DropDownList1.DataValueField = "CategoryID";
                DropDownList1.DataBind();
                DropDownList1.SelectedIndex = 0;
            }
            
        }

        protected void Button2_Command(object sender, CommandEventArgs e)
        {
           int productid = Convert.ToInt32(e.CommandArgument);
            Session["productid"] = productid;
            Response.Redirect("EditProductPage.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedCategoryId = Convert.ToInt32(DropDownList1.SelectedValue);
            int sellerid = Convert.ToInt32(Session["userid"]);

            DataSet productDataset = sellerInventory.FetchSellersProductsFilteredByCategory(sellerid, selectedCategoryId);
            DataList1.DataSource = productDataset;
            DataList1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int sellerid = Convert.ToInt32(Session["userid"]);

            DataSet productDataset = product.FetchAllProductsFromSellerInventory(sellerid);
            DataList1.DataSource = productDataset;
            DataList1.DataBind();
        }
    }
}