using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class CartClass
    {
        ConnectionClass connector = new ConnectionClass();
        public void AddProductToCart(int customerid,int productid)
        {
            string query;
            if (ProductAlreadyAddedInCart(productid, customerid))
            {
                string getQuantityQuery = $"SELECT Quantity FROM Carts WHERE ProductID={productid} AND CustomerID={customerid}";
                string quantity = connector.ScalarFunction(getQuantityQuery);
                int newQuantity = Convert.ToInt32(quantity) + 1;
                query = $"UPDATE Carts SET Quantity={newQuantity} WHERE ProductID={productid} AND CustomerID={customerid}";
            }
            else
            {
                string date = DateTime.Now.ToString("yyyy-MMM-dd");
                query = $"INSERT INTO Carts VALUES ({customerid},{productid},1,'{date}')";
            }

            int inserted = connector.NonQueryFunction(query);
        }

        public bool ProductAlreadyAddedInCart(int productid,int customerid)
        {
            string query = "SELECT COUNT(CartID) FROM Carts WHERE " +
                $"ProductID={productid} AND CustomerID={customerid}";

            string count = connector.ScalarFunction(query);
            if (count == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public int GetTotalCountofItemsInCartForCustomer(int customerid)
        {
            string query = "SELECT SUM(Quantity) FROM Carts WHERE CustomerID=" + customerid;
            string count = connector.ScalarFunction(query);
            if (count == "" || count==null || count=="0")
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(count);
            }
        }

        public int GetQuantityOfProductInCart(int customerid,int productid)
        {
            string query = "SELECT SUM(Quantity) FROM Carts WHERE " +
                "CustomerID=" + customerid + " AND ProductID="+productid;

            string quantity = connector.ScalarFunction(query);
            if (quantity == "" || quantity == "0"||quantity==null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(quantity);
            }
        }


        public DataSet GetCartOfCustomer(int customerid)
        {
            string query = "SELECT C.ProductID,ProductImage, ProductName, ProductPrice, Quantity FROM Carts C " +
                "INNER JOIN ProductTable P ON C.ProductID = P.ProductID WHERE CustomerID=" + customerid;

            return connector.DataSetFunction(query);
        }

        public void UpdateProductQuantity(int productid,string newquantity,int customerid)
        {
            string query = $"UPDATE Carts SET Quantity={newquantity} " +
                $"WHERE ProductID={productid} AND CustomerID={customerid}";

            connector.NonQueryFunction(query);
        }

        public void RemoveFromCart(int productid,int customerid)
        {
            string query = $"DELETE FROM Carts WHERE ProductID={productid} AND CustomerID={customerid}";
            connector.NonQueryFunction(query);
        }
    }
}
