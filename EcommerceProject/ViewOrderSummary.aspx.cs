using System;
using System.Data;
using BLL;

namespace EcommerceProject
{
    public partial class ViewOrderSummary : System.Web.UI.Page
    {
        CartClass cart = new CartClass();
        Card card = new Card();
        OrderClassBLL order = new OrderClassBLL();
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
            string cardNumber = TextBox6.Text;
            string cvv = TextBox5.Text;
            bool isCardValid = card.CheckIfCardIsValid(cardNumber, cvv);
            if (isCardValid)
            {
                if (RadioButton1.Checked)
                {
                    card.SaveCard(cardNumber,cvv,customerid);        
                }

                order.PlaceOrder(customerid);
                //bill.GenerateBill(customerid);
                //cart.ClearCart(customerid);
               // card.MakePayment(grandtotal);
                Response.Redirect("PleaseWaitPage.aspx");

            }

        }
    }
}