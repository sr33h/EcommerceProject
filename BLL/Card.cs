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
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_SaveCard";

            cmd.Parameters.AddWithValue("@cardnumber", cardNumber);
            cmd.Parameters.AddWithValue("@cvv", cvv);
            cmd.Parameters.AddWithValue("@customerid", customerid);

            connector.NonQueryFunctionUsingSP(cmd);
        }
    }
}
