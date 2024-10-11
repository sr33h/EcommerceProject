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
    public partial class SellerFeedbackPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            int sellerid = Convert.ToInt32(Session["userid"]);
            DataSet deliveredOrders = order.FetchOrdersDeliveredBySeller(sellerid);
            GridView1.DataSource = deliveredOrders;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int i = e.NewSelectedIndex;
            int orderid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            Session["orderid"] = orderid;
            Response.Redirect("ViewFeedbackPage.aspx");
        }
    }
}