using System;
using System.Data;
using BLL;

namespace EcommerceProject
{
    public partial class AddNewProductPage : System.Web.UI.Page
    {
        SellerInventory sellerInventory = new SellerInventory();
        ProductClass productClass = new ProductClass();
        CategoryClass categoryClass = new CategoryClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet categoryDataset = categoryClass.getAllCategories();
                DropDownList1.DataSource = categoryDataset;
                DropDownList1.DataTextField = "CategoryName";
                DropDownList1.DataValueField = "CategoryID";
                DropDownList1.DataBind();
            }            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(DropDownList1.SelectedValue);
            string path = "~/productImages/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(path));
            bool productAlreadyAdded = productClass.CheckIfProductExist(TextBox1.Text);
            if (productAlreadyAdded)
            {
                Label1.Text = "This Product Name is already added. " +
                    "Change the product name if this is a new product.";
            }
            else
            {
                int productAdded = sellerInventory.AddNewProduct(
                TextBox1.Text,
                TextBox2.Text,
                TextBox3.Text,
                categoryId,
                path);

                if (productAdded == 1)
                {
                    int productId = productClass.GetProductId(TextBox1.Text);
                    int sellerId = Convert.ToInt32(Session["userid"]);
                    sellerInventory.AddToInventory(productId,sellerId,TextBox4.Text);

                    Response.Redirect("SellerInventoryPage.aspx");
                }
            }    
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerInventoryPage.aspx");
        }
    }
}