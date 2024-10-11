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
    public partial class LandingPage : System.Web.UI.Page
    {
        ProductClass productClass = new ProductClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet productDataset = productClass.GetFirstNineProducts();
            DataList1.DataSource = productDataset;
            DataList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}