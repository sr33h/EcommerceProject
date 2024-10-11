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
    public partial class SendFeedbackPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        FeedbackClass feedback = new FeedbackClass();
        CartClass cart = new CartClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int customerid = Convert.ToInt32(Session["userid"]);
                int itemsInCart = cart.GetTotalCountofItemsInCartForCustomer(customerid);
                Label3.Text = $"({itemsInCart})";
                int orderid = Convert.ToInt32(Session["orderid"]);
                SqlDataReader orderDetails = order.FetchOrderDetailsForCustomerFeedback(orderid);
                while (orderDetails.Read())
                {
                    Image1.ImageUrl = orderDetails["ProductImage"].ToString();
                    Label9.Text = orderDetails["ProductName"].ToString();
                    Label10.Text = orderDetails["ProductPrice"].ToString();
                    Label11.Text = orderDetails["Quantity"].ToString();
                    Label12.Text = orderDetails["SellerName"].ToString();
                }

                if (feedback.FeedbackSentByCustomer(orderid))
                {
                    Button2.Text = "Feedback Completed !";
                    Button2.Enabled = false;
                    Button2.BackColor = System.Drawing.Color.Green;
                    Button2.ForeColor = System.Drawing.Color.White;
                    Button2.Width = Unit.Parse("200px");
                    TextBox1.Enabled = false;
                    if (feedback.SellerRepliedToFeedback(orderid))
                    {
                        TextBox1.Visible = false;
                        string feedbackMessage = feedback.GetFeedbackMessage(orderid);
                        string replyMessage = feedback.GetReplyMessage(orderid);
                        Label13.Text = $"Your feedback : {feedbackMessage}";
                        Label15.Text = $"Seller reply : {replyMessage}";
                        Label15.Visible = true;
                    }
                    else
                    {
                        Label13.Text = "Seller not yet replied.";
                    }
                }
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Length > 250)
            {
                Label14.Visible = true;
            }
            else
            {
                int orderid = Convert.ToInt32(Session["orderid"]);
                string feedbackMessage = TextBox1.Text;
                feedback.SubmitFeedbackMessage(orderid, feedbackMessage);
                Label14.Visible = false;        
                Button2.Text = "Feedback Sent!";
                Button2.BackColor = System.Drawing.Color.Green;
                Button2.ForeColor = System.Drawing.Color.White;
                Button2.Enabled = false;
               
                
            }
        }
    }
}