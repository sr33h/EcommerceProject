using System;
using System.Data;
using System.Data.SqlClient;
using BLL;

namespace EcommerceProject
{
    public partial class EditProductPage : System.Web.UI.Page
    {
        SellerInventory sellerInventory = new SellerInventory();
        ProductClass productClass = new ProductClass();
        CategoryClass categoryClass = new CategoryClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int sellerid = Convert.ToInt32(Session["userid"]);
                DataSet categoryDataset = categoryClass.getAllCategories();
                DropDownList1.DataSource = categoryDataset;
                DropDownList1.DataTextField = "CategoryName";
                DropDownList1.DataValueField = "CategoryID";
                DropDownList1.DataBind();
                int productid = Convert.ToInt32(Session["productid"]);
                SqlDataReader productDetails = productClass.GetProductDetailsAndStock(productid);
                while (productDetails.Read())
                {
                    TextBox1.Text = productDetails["ProductName"].ToString();
                    TextBox2.Text = productDetails["ProductDescription"].ToString();
                    TextBox3.Text = productDetails["ProductPrice"].ToString();
                    DropDownList1.SelectedValue = productDetails["ProductCategoryID"].ToString();
                    Image1.ImageUrl = productDetails["ProductImage"].ToString();
                    TextBox4.Text = productDetails["Stock"].ToString();
                }              
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string newName;
            string newDesc;
            string newpath = "";
            string newPrice;
            string newCategory;
            string newStock;
            int productid = Convert.ToInt32(Session["productid"]);

            if (FileUpload1.HasFile)
            {
                newpath = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(newpath));
            }

            newName = TextBox1.Text;
            newDesc = TextBox2.Text;
            newPrice = TextBox3.Text;
            newCategory = DropDownList1.SelectedValue;
            newStock = TextBox4.Text;

            int i = productClass.UpdateProduct(productid,newName, newDesc, newPrice,newCategory,newpath,newStock);
            if (i == 1)
            {
                Response.Redirect("ManageProductsPage.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageProductsPage.aspx");
        }
    }
}