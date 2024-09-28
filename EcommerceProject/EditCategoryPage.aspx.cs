using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace EcommerceProject
{
    public partial class EditCategoryPage1 : System.Web.UI.Page
    {
        CategoryClass categoryClass = new CategoryClass();
        

    protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int categoryId = Convert.ToInt32(Session["categoryIdToEdit"]);
                SqlDataReader categoryDetails = categoryClass.getCategoryDetails(categoryId);
                while (categoryDetails.Read())
                {
                    TextBox1.Text = categoryDetails["CategoryName"].ToString();
                    TextBox2.Text = categoryDetails["CategoryDescription"].ToString();
                    Image1.ImageUrl = categoryDetails["CategoryImage"].ToString();
                    DropDownList1.SelectedValue = categoryDetails["CategoryStatus"].ToString();
                }
            }            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string newName;
            string newDesc;
            string newpath = "";
            string newstatus;
            int categoryId = Convert.ToInt32(Session["categoryIdToEdit"]);

                       
            if (FileUpload1.HasFile)
            {
                newpath = "~/images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(newpath));
            }
            newstatus = DropDownList1.SelectedValue;

            newName = TextBox1.Text;
            newDesc = TextBox2.Text;

            int i = categoryClass.updateCategory(categoryId,newName, newDesc, newpath,newstatus);
            if (i == 1)
            {
                Response.Redirect("ManageCategoryPage.aspx");
            }            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCategoryPage.aspx");
        }
    }
}