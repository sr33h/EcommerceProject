using System;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BLL
{
    public class ProductClass
    {
        ConnectionClass connector = new ConnectionClass();

        public bool CheckIfProductExist(string productName)
        {
            string selectQuery = "SELECT COUNT(ProductID) FROM ProductTable " +
                "WHERE ProductName='"+productName+"'";

            string count = connector.ScalarFunction(selectQuery);

            if (count == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int GetProductId(string productName)
        {
            string selectQuery = "SELECT ProductID FROM ProductTable " +
                "WHERE ProductName='" + productName + "'";

            string productId = connector.ScalarFunction(selectQuery);

            return Convert.ToInt32(productId);
        }

        public DataSet FetchProductsByCategory(int categoryId)
        {
            string selectQuery = "SELECT * FROM ProductTable WHERE ProductCategoryID = " + categoryId;

            return connector.DataSetFunction(selectQuery);
        }

        public DataSet FetchAllProductsFromSellerInventory(int sellerid)
        {
            string selectQuery = "SELECT P.ProductID,ProductName, ProductDescription, ProductPrice, " +
                "ProductCategoryID, ProductImage, Stock FROM " +
                "ProductTable P INNER JOIN InventoryTable I " +
                "ON P.ProductID = I.ProductID WHERE I.SellerID = "+ sellerid;

            return connector.DataSetFunction(selectQuery);
        }

        public SqlDataReader GetProductDetailsAndStock(int productid)
        {
            string selectQuery = "SELECT P.ProductID ,ProductName, ProductDescription, " +
                "ProductPrice, ProductCategoryID, ProductImage, Stock " +
                "FROM ProductTable P INNER JOIN InventoryTable I " +
                "ON P.ProductID = I.ProductID " +
                "WHERE P.ProductID = "+productid;

            return connector.ReaderFunction(selectQuery);
        }

        public int UpdateProduct(
            int productid,
            string productName,
            string productDesc,
            string productPrice,
            string categoryID,
            string productImage,
            string stock
            )
        {
            string updateQuery = $"UPDATE ProductTable SET " +
                $"ProductName = '{productName}'," +
                $"ProductDescription = '{productDesc}'," +
                $"ProductPrice = {productPrice}," +
                $"ProductCategoryID ={categoryID}," +
                $"ProductImage = '{productImage}' WHERE ProductID = " + productid;

              int productupdated = connector.NonQueryFunction(updateQuery);
            if(productupdated == 1)
            {
                return RestockProduct(productid, stock);
            }
            else
            {
                return -1;
            }
        }

        public int RestockProduct(int productid, string newstock)
        {
            string updateQuery = $"UPDATE InventoryTable " +
                $"SET Stock = {newstock} WHERE ProductID=" + productid;

            return connector.NonQueryFunction(updateQuery);
        }
    }
}
