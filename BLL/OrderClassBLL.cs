using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;

namespace BLL
{
    public class OrderClassBLL
    {
        ConnectionClass connector = new ConnectionClass();
        public void PlaceOrder(int customerid)
        {
            string query = "SELECT SellerID,CustomerID, C.ProductID, Quantity " +
                "FROM Carts C INNER JOIN InventoryTable I ON C.ProductID = I.ProductID" +
                " WHERE C.CustomerID = "+customerid;

            DataTable orderDetailsTable =  connector.DataTableFunction(query);

            Table<Orders> orderEntityTable = connector.GetOrderTable();

            for (int i = 0; i <= orderDetailsTable.Rows.Count - 1; i++)
            {
                Orders order = new Orders
                {
                    SellerID = orderDetailsTable.Rows[i].Field<int>("SellerID"),
                    CustomerID = orderDetailsTable.Rows[i].Field<int>("CustomerID"),
                    ProductID = orderDetailsTable.Rows[i].Field<int>("ProductID"),
                    Quantity = orderDetailsTable.Rows[i].Field<int>("Quantity"),
                    OrderStatus = "Ordered",
                };
                orderEntityTable.InsertOnSubmit(order);
                connector.SubmitOrder();
            }


        }
    }
}
