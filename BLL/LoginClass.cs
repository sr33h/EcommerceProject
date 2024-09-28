using System;
using DAL;

namespace BLL
{
    public class LoginClass
    {
        ConnectionClass connector = new ConnectionClass();
        public int LoginFunction(string username, string password)
        {
            string query = "SELECT COUNT(LoginID) FROM UserRegistrationTable WHERE Username='" + username + "'" + " AND Password='" + password + "'";
            string idFound = connector.ScalarFunction(query);
            return Convert.ToInt32(idFound);
        }

        public int GetUserID(string username, string password)
        {
            string query = "SELECT RegID FROM UserRegistrationTable WHERE Username='" + username + "'" + " AND Password='" + password + "'";
            string userid = connector.ScalarFunction(query);
            return Convert.ToInt32(userid);
        }

        public string GetUserType(string username, string password)
        {
            string query = "SELECT LoginType FROM UserRegistrationTable WHERE Username='" + username + "'" +
                " AND Password='" + password + "'";

            return connector.ScalarFunction(query);

           
        }
    }
}
