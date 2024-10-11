using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace EcommerceProject
{
    public partial class SellerOrdersPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int sellerid = Convert.ToInt32(Session["userid"]);
                DataSet ordersReceived = order.GetSellerOrders(sellerid);
                DataList1.DataSource = ordersReceived;
                DataList1.DataBind();
            }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataListItem item = (DataListItem)(sender as Button).NamingContainer;
            string txtId = ((Label)item.FindControl("Label7")).Text.Trim();
            Session["orderid"] = txtId;
            Response.Redirect("SellerOrderStatusUpdate.aspx");
        }
    }
}