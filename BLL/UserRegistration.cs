using System;
using DAL;

namespace BLL
{
    public class UserRegistration
    {
        ConnectionClass connector = new ConnectionClass();
        public int RegisterUserFunction(
            string name,
            string email,
            string phone,
            string address,
            string username,
            string password,
            string usertype)
        {
            string insertQuery;
            string getmaxid;

            if (usertype == "Customer")
            {
                getmaxid = "SELECT MAX(CustomerID) FROM CustomerTable";
                string maxid = connector.ScalarFunction(getmaxid);
                int nextid;
                if (maxid == null || maxid == "")
                {
                    nextid = 1;
                }
                else
                {
                    nextid = Convert.ToInt32(maxid) + 1;
                }
                insertQuery = "INSERT INTO CustomerTable VALUES (" + nextid + ",'" + name + "'," +
                    "'" + email + "'," +
                    "'" + phone + "'," +
                    "'" + address + "'," +
                    "'" + username + "'," +
                    "'" + password + "'," +
                    "'Active'" +
                    ")";

                int rowsinserted = connector.NonQueryFunction(insertQuery);
                if (rowsinserted == 1)
                {
                    string insertToRegisterTable = "INSERT INTO UserRegistrationTable VALUES (" +
                        "" + nextid + "," +
                        "'" + username + "'," +
                        "'" + password + "'," +
                        "'Customer'," +
                        "'Active')";
                    return connector.NonQueryFunction(insertToRegisterTable);
                }
            }
            else
            {
                getmaxid = "SELECT MAX(SellerID) FROM SellerTable";
                string maxid = connector.ScalarFunction(getmaxid);
                int nextid;
                if (maxid == null || maxid == "")
                {
                    nextid = 1;
                }
                else
                {
                    nextid = Convert.ToInt32(maxid) + 1;
                }

                insertQuery = "INSERT INTO SellerTable VALUES (" + nextid + ",'" + name + "'," +
                    "'" + email + "'," +
                    "'" + address + "'," +
                    "'" + phone + "'," +
                    "'" + username + "'," +
                    "'" + password + "'," +
                    "'Active'" +
                    ")";

                int rowsinserted = connector.NonQueryFunction(insertQuery);
                if (rowsinserted == 1)
                {
                    string insertToRegisterTable = "INSERT INTO UserRegistrationTable VALUES (" +
                        "" + nextid + "," +
                        "'" + username + "'," +
                        "'" + password + "'," +
                        "'Seller'," +
                        "'Active')";
                    return connector.NonQueryFunction(insertToRegisterTable);
                }
            }
            return -1;
        }

        public bool IsUsernameAlreadyTaken(string username)
        {
            string getUsername = "SELECT COUNT(LoginID) FROM UserRegistrationTable WHERE Username = '" + username + "'";
            string countOfUsername = connector.ScalarFunction(getUsername);
            if (countOfUsername == "0" || countOfUsername == "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
