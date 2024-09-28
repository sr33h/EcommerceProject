using System;
using BLL;

namespace EcommerceProject
{
    public partial class AddCategoryPage : System.Web.UI.Page
    {
        SellerInventory sellerInventory = new SellerInventory();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = "~/categoryImages/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(path));
            int categoryInserted = sellerInventory.AddNewCategory(TextBox1.Text,TextBox2.Text,path);

            if(categoryInserted == 1)
            {
                
                Response.Redirect("SellerInventoryPage.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SellerInventoryPage.aspx");
        }
    }
}