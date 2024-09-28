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
    public partial class EditCategoryPage : System.Web.UI.Page
    {
        CategoryClass categoryClass = new CategoryClass();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet categoryDataset = categoryClass.getAllCategories();
                DataList1.DataSource = categoryDataset;
                DataList1.DataBind();
            }            
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            int categoryIdToEdit = Convert.ToInt32(e.CommandArgument);
            Session["categoryIdToEdit"] = categoryIdToEdit;
            Response.Redirect("EditCategoryPage.aspx");
        }

        
    }
}