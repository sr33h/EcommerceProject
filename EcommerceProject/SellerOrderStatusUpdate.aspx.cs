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
    public partial class SellerOrderStatusUpdate : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        SellerInventory inventory = new SellerInventory();

        public void ReloadOrderDetails()
        {
            string orderid = Session["orderid"].ToString();
            SqlDataReader orderdetails = order.GetOrderDetails(orderid);
            while (orderdetails.Read())
            {
                Image1.ImageUrl = orderdetails["ProductImage"].ToString();
                Label1.Text = orderdetails["ProductName"].ToString();
                Label2.Text = orderdetails["ProductPrice"].ToString();
                Label3.Text = orderdetails["Quantity"].ToString();
                Label4.Text = orderdetails["OrderStatus"].ToString();
                Label5.Text = orderdetails["CustomerAddress"].ToString();
            }
            if (Label4.Text == "Ordered")
            {
                Label6.Text = "Click below to ship the order";
                Button2.Visible = true;
                Button3.Visible = false;
            }
            else if (Label4.Text == "Shipped")
            {
                Label6.Text = "Click below to deliver the order";
                Button3.Visible = true;
                Button2.Visible = false;
            }
            else
            {
                Label6.Text = "Order is delivered. No further changes are allowed.";
                Button3.Visible = false;
                Button2.Visible = false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReloadOrderDetails();
               
            }
            
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int orderid = Convert.ToInt32(Session["orderid"].ToString());
            string newstatus = "Shipped";
            order.UpdateOrderStatus(orderid,newstatus);
            inventory.UpdateProductStock(orderid);
            ReloadOrderDetails();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int orderid = Convert.ToInt32(Session["orderid"].ToString());
            string newstatus = "Delivered";
            order.UpdateOrderStatus(orderid, newstatus);
            ReloadOrderDetails();
        }
    }
}