using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    
    public class CategoryClass
    {
        ConnectionClass connector = new ConnectionClass();
        public DataSet getAllCategories()
        {
            string selectQuery = "SELECT * FROM ProductCategoryTable";

            return connector.DataSetFunction(selectQuery);
        }

        public string GetCategoryName(int categoryId)
        {
            string selectQuery = "SELECT CategoryName FROM ProductCategoryTable " +
                "WHERE CategoryID=" + categoryId;

            return connector.ScalarFunction(selectQuery);
        }


        public int updateCategory(
            int categoryId, 
            string newName, 
            string newDesc, 
            string newpath, 
            string newstatus)
        {

            string updateQuery = $"UPDATE ProductCategoryTable SET CategoryName='{newName}'," +
                $"CategoryDescription='{newDesc}',CategoryStatus='{newstatus}'" +
                $"WHERE CategoryID={categoryId}";

            if (newpath != "")
            {
                updateQuery = $"UPDATE ProductCategoryTable SET CategoryName='{newName}'," +
                $"CategoryDescription='{newDesc}',CategoryImage = '{newpath}',CategoryStatus='{newstatus}'" +
                $"WHERE CategoryID={categoryId}"; 
            }

           return connector.NonQueryFunction(updateQuery);
        }

        public SqlDataReader getCategoryDetails(int categoryId)
        {
            string selectQuery = "SELECT * FROM ProductCategoryTable WHERE CategoryID="+categoryId;

            return connector.ReaderFunction(selectQuery);
        }

    }
}
