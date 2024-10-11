using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SellerInventory
    {
        ConnectionClass connector = new ConnectionClass();
        public DataSet FetchAllSellerProducts(int sellerId)
        {
            string selectQuery = "SELECT ProductImage,ProductName, " +
                "ProductPrice,Stock FROM InventoryTable " +
                "INNER JOIN ProductTable ON " +
                "InventoryTable.ProductID = ProductTable.ProductID " +
                "WHERE SellerID = " + sellerId;

            DataSet productsDataset = connector.DataSetFunction(selectQuery);
            return productsDataset;
        }


        public int AddNewProduct(
            string productName,
            string productDesc,
            string productPrice,
            int categoryId,
            string productImage)
        {
            string addProduct = $"INSERT INTO ProductTable VALUES('{productName}'," +
                $"'{productDesc}',{productPrice},{categoryId},'{productImage}')";

           return connector.NonQueryFunction(addProduct);
                       
        }

        public int AddNewCategory(
            string categoryName,
            string categoryDescription,
            string categoryImage)
        {
            string insertQuery = $"INSERT INTO ProductCategoryTable VALUES(" +
                $"'{categoryName}'," +
                $"'{categoryDescription}'," +
                $"'{categoryImage}'," +
                $"'Active')";

           return connector.NonQueryFunction(insertQuery);
        }

        public int RestockProduct(int stockId)
        {
            return 1;
        }

        public void AddToInventory(int productId,int sellerId,string quantity)
        {
            string insertQuery = $"INSERT INTO InventoryTable VALUES(" +
                $"{productId}," +
                $"{sellerId}," +
                $"{quantity})";

            connector.NonQueryFunction(insertQuery);
        }

        public DataSet GetCategoriesOfSeller(int sellerid)
        {
            string selectQuery = "SELECT DISTINCT CategoryName,CategoryID FROM ProductCategoryTable C " +
                "INNER JOIN ProductTable P ON C.CategoryID = P.ProductCategoryID " +
                "WHERE P.ProductID IN(" +
                "SELECT P.ProductID FROM ProductTable P INNER JOIN InventoryTable I" +
                $" ON P.ProductID = I.ProductID WHERE I.SellerID = {sellerid})";

            DataSet categoryDataset = connector.DataSetFunction(selectQuery);
            return categoryDataset;
        }

        public DataSet FetchSellersProductsFilteredByCategory(int sellerId,int categoryid)
        {
            string selectQuery = "SELECT P.ProductID ,ProductName, ProductDescription, ProductPrice, " +
                "ProductCategoryID, ProductImage FROM ProductTable P INNER JOIN InventoryTable I " +
                $"ON P.ProductID = I.ProductID WHERE I.SellerID = {sellerId} AND P.ProductCategoryID = {categoryid}";

            DataSet productsDataset = connector.DataSetFunction(selectQuery);
            return productsDataset;
        }

       public void UpdateProductStock(int orderid)
        {
            string getQuantity = "SELECT Quantity FROM Orders WHERE OrderID=" + orderid;
            string getProductID = "SELECT ProductID FROM Orders WHERE OrderID=" + orderid;
            string quantity = connector.ScalarFunction(getQuantity);
            string productid = connector.ScalarFunction(getProductID);
            string query = $"UPDATE InventoryTable SET Stock = Stock-{quantity} WHERE ProductID=" + productid;
            connector.NonQueryFunction(query);
        }

    }
}
