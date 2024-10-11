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
    public partial class ViewFeedbackPage : System.Web.UI.Page
    {
        OrderClass order = new OrderClass();
        FeedbackClass feedback = new FeedbackClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderid = Convert.ToInt32(Session["orderid"]);
                SqlDataReader orderDetails = order.FetchOrderDetailsForSellerFeedback(orderid);
                while (orderDetails.Read())
                {
                    Image1.ImageUrl = orderDetails["ProductImage"].ToString();
                    Label9.Text = orderDetails["ProductName"].ToString();
                    Label10.Text = orderDetails["ProductPrice"].ToString();
                    Label11.Text = orderDetails["Quantity"].ToString();
                    Label12.Text = orderDetails["CustomerName"].ToString();
                }

                if (feedback.FeedbackSentByCustomer(orderid))
                {
                    Label16.Text = feedback.GetFeedbackMessage(orderid);
                }
                else
                {
                    Label16.Text = "Customer has not sent their feedback for this order yet.";
                    Label15.Visible = false;
                    Button2.Enabled = false;
                    TextBox1.Enabled = false;
                }

                if (feedback.SellerRepliedToFeedback(orderid))
                {
                    Button2.Text = "Already Replied !";
                    Button2.Enabled = false;
                    Button2.BackColor = System.Drawing.Color.Green;
                    Button2.ForeColor = System.Drawing.Color.White;
                    Button2.Width = Unit.Parse("200px");
                    TextBox1.Enabled = false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length > 250)
            {
                Label14.Visible = true;
            }
            else
            {
                int orderid = Convert.ToInt32(Session["orderid"]);
                string feedbackReply = TextBox1.Text;
                feedback.SendReplyToCustomer(orderid, feedbackReply);
                Label14.Visible = false;
                Button2.Text = "Reply Sent!";
                Button2.BackColor = System.Drawing.Color.Green;
                Button2.ForeColor = System.Drawing.Color.White;
                Button2.Enabled = false;
            }
        }
    }
}