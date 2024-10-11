using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace EcommerceProject
{
    public partial class CustomerFeedbackPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        CartClass cart = new CartClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Session["userid"]);
            DataSet deliveredOrders = order.FetchOrdersDeliveredToCustomer(customerid);
            GridView1.DataSource = deliveredOrders;
            GridView1.DataBind();
            int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
            Label3.Text = $"({itemsInCart})";
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int i = e.NewSelectedIndex;
            int orderid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            Session["orderid"] = orderid;
            Response.Redirect("SendFeedbackPage.aspx");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }
    }
}