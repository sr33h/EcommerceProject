using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using System.Data.SqlClient;

namespace BLL
{
    public class Card
    {
        ConnectionClass connector = new ConnectionClass();
        public bool CheckIfCardIsValid(string cardnumber, string cvv)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_CheckCardValidity";

            cmd.Parameters.AddWithValue("@cardnumber", cardnumber);
            cmd.Parameters.AddWithValue("@cvv", cvv);

            string found = connector.ScalarFunctionUsingSP(cmd);

            if (found == "1")
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public void SaveCard(string cardNumber, string cvv, int customerid) 
        {
            if (!IfCardSaved(customerid))
            {

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_SaveCard";

                cmd.Parameters.AddWithValue("@cardnumber", cardNumber);
                cmd.Parameters.AddWithValue("@cvv", cvv);
                cmd.Parameters.AddWithValue("@customerid", customerid);

                connector.NonQueryFunctionUsingSP(cmd);
            }
            else
            {
                string updateCard = $"UPDATE SavedCards SET CardNumber={cardNumber},CVV={cvv} WHERE" +
                    $" CustomerID=" + customerid;

                connector.NonQueryFunction(updateCard);
            }
        }

        public bool IfCardSaved(int customerid)
        {
            string query = "SELECT COUNT(CardNumber) FROM SavedCards WHERE CustomerID=" + customerid;
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

        public SqlDataReader GetSavedCard(int customerid)
        {
            string query = $"SELECT * FROM SavedCards WHERE CustomerID="+customerid;
            return connector.ReaderFunction(query);
        }

        public bool MakePayment(string cardnumber,int grandtotal)
        {
            BankAccountService.ServiceClient obj = new BankAccountService.ServiceClient();
            string balance = obj.GetBalance(cardnumber);
            if(Convert.ToInt32(balance) < grandtotal)
            {
                return false;
            }
            else
            {
                return obj.DeductAmount(cardnumber,grandtotal);               
            }

        }
    }
}
