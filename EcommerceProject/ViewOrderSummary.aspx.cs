using System;
using System.Data;
using System.Data.SqlClient;
using BLL;

namespace EcommerceProject
{
    public partial class ViewOrderSummary : System.Web.UI.Page
    {
        CartClass cart = new CartClass();
        Card card = new Card();
        OrderClass order = new OrderClass();
        int grandtotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int customerid = Convert.ToInt32(Session["userid"]);
                DataSet cartDataSet = cart.GetCartOfCustomer(customerid);
                GridView1.DataSource = cartDataSet;
                GridView1.DataBind();
                
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    int price = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                    int quantity = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                    grandtotal += price * quantity;
                }
                Label6.Text = $"Rs.{grandtotal} /-";

                if (card.IfCardSaved(customerid))
                {
                    SqlDataReader cardDataReader = card.GetSavedCard(customerid);
                    while (cardDataReader.Read())
                    {
                        TextBox6.Text = cardDataReader["CardNumber"].ToString();
                        TextBox5.Text = cardDataReader["CVV"].ToString();
                    }
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int customerid = Convert.ToInt32(Session["userid"]);
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int price = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                int quantity = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                grandtotal += price * quantity;
            }
            string cardNumber = TextBox6.Text;
            string cvv = TextBox5.Text;
            bool isCardValid = card.CheckIfCardIsValid(cardNumber, cvv);
            if (isCardValid)
            {
                if (RadioButton1.Checked)
                {
                    card.SaveCard(cardNumber,cvv,customerid);        
                }

                bool paymentSuccess = card.MakePayment(cardNumber,grandtotal);

                if (paymentSuccess)
                {
                    order.PlaceOrder(customerid);
                    cart.ClearCart(customerid);
                    Response.Redirect("PaymentSuccess.aspx");
                }
                else
                {
                    Label5.Text = "Payment failed due to insufficient funds in the provided card";
                }


            }
            else
            {
                Label5.Text = "Invalid card details. Enter a valid card number and cvv.";
            }

        }
    }
}