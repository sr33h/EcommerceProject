using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class SellerDetails
    {
        ConnectionClass connector = new ConnectionClass();
        public string GetSellerName(int sellerId)
        {
            string selectQuery = "SELECT SellerName FROM SellerTable WHERE SellerID=" + sellerId;

            return connector.ScalarFunction(selectQuery);
        }
    }
}
