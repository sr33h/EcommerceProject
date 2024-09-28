using System;
using System.Data;
using System.Web.UI.WebControls;
using BLL;

namespace EcommerceProject
{
    
    public partial class ViewCartPage : System.Web.UI.Page
    {
        CartClass cart = new CartClass();

        public void CalculateGrandTotal()
        {
            int grandtotal = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int price = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                int quantity = Convert.ToInt32(GridView1.Rows[i].Cells[3].Text);
                grandtotal += price * quantity;
            }
            OrderTotal.Text = grandtotal.ToString();
        }
        public void GridBind()
        {
            int customerid = Convert.ToInt32(Session["userid"]);
            DataSet cartDataSet = cart.GetCartOfCustomer(customerid);
            GridView1.DataSource = cartDataSet;
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridBind();
                CalculateGrandTotal();
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowindex = e.RowIndex;
            int productid = Convert.ToInt32(GridView1.DataKeys[rowindex].Value);
            int customerid = Convert.ToInt32(Session["userid"]);
            TextBox qtyTextBox = (TextBox)GridView1.Rows[rowindex].Cells[2].Controls[0];
            cart.UpdateProductQuantity(productid, qtyTextBox.Text,customerid);
            GridView1.EditIndex = -1;
            GridBind();
            CalculateGrandTotal();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowindex = e.RowIndex;
            int productid = Convert.ToInt32(GridView1.DataKeys[rowindex].Value);
            int customerid = Convert.ToInt32(Session["userid"]);
            cart.RemoveFromCart(productid,customerid);
            GridBind();
            CalculateGrandTotal();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrderSummary.aspx");

        }
    }
}