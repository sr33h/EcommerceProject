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
    public partial class CustomerOrdersPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        CartClass cart = new CartClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Session["userid"]);
            DataSet customerOrders = order.GetCustomerOrders(customerid);
            DataList1.DataSource = customerOrders;
            DataList1.DataBind();
           
            int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
            Label3.Text = $"({itemsInCart})";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }
    }
}