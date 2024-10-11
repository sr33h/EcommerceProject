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
    public class OrderClass
    {
        ConnectionClass connector = new ConnectionClass();
        public void PlaceOrder(int customerid)
        {
            string selectQuery = "SELECT SellerID,CustomerID, C.ProductID, Quantity " +
                "FROM Carts C INNER JOIN InventoryTable I ON C.ProductID = I.ProductID" +
                " WHERE C.CustomerID = "+customerid;

            DataTable orderDataTable = connector.DataTableFunction(selectQuery);
            int sellerID, customerID, productID, quantity;

            int orderID = 1;

            string getOrderIDQuery = "SELECT MAX(OrderID) FROM Orders";

            string maxorderid = connector.ScalarFunction(getOrderIDQuery);

            if(maxorderid != "")
            {
                orderID = Convert.ToInt32(maxorderid) + 1;
            }

            for (int i = 0; i < orderDataTable.Rows.Count; i++) 
            {
               sellerID = orderDataTable.Rows[i].Field<int>("SellerID");
                customerID = orderDataTable.Rows[i].Field<int>("CustomerID");
                productID = orderDataTable.Rows[i].Field<int>("ProductID");
                quantity = orderDataTable.Rows[i].Field<int>("Quantity");

                string insertQuery = $"INSERT INTO Orders VALUES(" +
                    $"{orderID},{sellerID},{customerID},{productID},{quantity},'Ordered')";

               connector.NonQueryFunction(insertQuery);                
            }
                           
        }

        public DataSet GetCustomerOrders(int customerid)
        {
            string sqlquery = "SELECT ProductImage,ProductName,ProductPrice,Quantity," +
                "OrderStatus,CustomerAddress FROM Orders O INNER JOIN ProductTable P ON " +
                "O.ProductID = P.ProductID INNER JOIN CustomerTable C ON C.CustomerID = O.CustomerID " +
                "WHERE O.CustomerID = " + customerid;

           return connector.DataSetFunction(sqlquery);
        }

        public DataSet GetSellerOrders(int sellerid)
        {
            string sqlquery = "SELECT O.OrderID,ProductImage,ProductName,ProductPrice,Quantity," +
                "OrderStatus,CustomerAddress FROM Orders O INNER JOIN ProductTable P ON " +
                "O.ProductID = P.ProductID INNER JOIN SellerTable S ON S.SellerID = O.SellerID " +
                " INNER JOIN CustomerTable C ON O.CustomerID = C.CustomerID WHERE O.SellerID = " +
                sellerid;

            return connector.DataSetFunction(sqlquery);
        }

        public void UpdateOrderStatus(int orderid, string orderStatus)
        {
            string sqlquery = $"UPDATE Orders SET OrderStatus='{orderStatus}' WHERE " +
                $"OrderID="+orderid;

            connector.NonQueryFunction(sqlquery);
        }

        public SqlDataReader GetOrderDetails(string orderid)
        {
            string sqlquery = $"SELECT ProductImage,ProductName,ProductPrice,Quantity,OrderStatus," +
                $"CustomerAddress FROM ProductTable P INNER JOIN Orders O ON " +
                $"O.ProductID = P.ProductID INNER JOIN CustomerTable C ON " +
                $"O.CustomerID = C.CustomerID WHERE O.OrderID ="+orderid;

           return connector.ReaderFunction(sqlquery);
        }

        public DataSet FetchOrdersDeliveredToCustomer(int customerid)
        {
            string sqlquery = $"SELECT OrderID,ProductImage,ProductName,SellerName,Quantity" +
                $" FROM ProductTable P INNER JOIN Orders O ON " +
                $"O.ProductID = P.ProductID INNER JOIN SellerTable S ON " +
                $"S.SellerID = O.SellerID WHERE O.CustomerID =" + customerid + "AND O.OrderStatus ='Delivered'";

            return connector.DataSetFunction(sqlquery);

        }

        public SqlDataReader FetchOrderDetailsForCustomerFeedback(int orderid)
        {
            string query = $"SELECT ProductImage,ProductName,ProductPrice,Quantity,SellerName" +
                $" FROM Orders O INNER JOIN ProductTable P ON O.ProductID = P.ProductID " +
                $"INNER JOIN SellerTable S ON O.SellerID = S.SellerID WHERE OrderID=" + orderid;

            return connector.ReaderFunction(query);
        }

        public DataSet FetchOrdersDeliveredBySeller(int sellerid)
        {
            string sqlquery = $"SELECT OrderID,ProductImage,ProductName,CustomerName,Quantity" +
                $" FROM ProductTable P INNER JOIN Orders O ON " +
                $"O.ProductID = P.ProductID INNER JOIN CustomerTable C ON " +
                $"C.CustomerID = O.CustomerID WHERE O.SellerID =" + sellerid + 
                "AND O.OrderStatus ='Delivered'";

            return connector.DataSetFunction(sqlquery);

        }

        public SqlDataReader FetchOrderDetailsForSellerFeedback(int orderid)
        {
            string query = $"SELECT ProductImage,ProductName,ProductPrice,Quantity,CustomerName" +
                $" FROM Orders O INNER JOIN ProductTable P ON O.ProductID = P.ProductID " +
                $"INNER JOIN CustomerTable C ON C.CustomerID = O.CustomerID WHERE OrderID=" + orderid;

            return connector.ReaderFunction(query);
        }

    }
}
