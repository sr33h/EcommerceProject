using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class FeedbackClass
    {
        ConnectionClass connector = new ConnectionClass();
        public void SubmitFeedbackMessage(int orderid, string message)
        {
            string customerid="";
            string sellerid="";
            string getOrderDetails = "SELECT CustomerID,SellerID FROM Orders WHERE OrderID=" + orderid;

            SqlDataReader orderDetails = connector.ReaderFunction(getOrderDetails);
            while (orderDetails.Read())
            {
                customerid = orderDetails["CustomerID"].ToString();
                sellerid = orderDetails["SellerID"].ToString();
            }

            string insertMessage = $"INSERT INTO FeedbackTable VALUES({customerid},{sellerid}," +
                $"'{message}','SellerNotReplied',null,{orderid})";

            connector.NonQueryFunction(insertMessage);

        }

        public bool FeedbackSentByCustomer(int orderid)
        {
            string query = "SELECT FeedbackStatus FROM FeedbackTable WHERE OrderID=" + orderid;
            string feedbackstatus = connector.ScalarFunction(query);
            if(feedbackstatus== "SellerNotReplied" || feedbackstatus == "SellerReplied")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool SellerRepliedToFeedback(int orderid)
        {
            string query = "SELECT FeedbackStatus FROM FeedbackTable WHERE OrderID=" + orderid;
            string feedbackstatus = connector.ScalarFunction(query);
            if (feedbackstatus == "SellerReplied")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public string GetFeedbackMessage(int orderid)
        {
            string query = "SELECT FeedbackMessage FROM FeedbackTable WHERE OrderID=" + orderid;
            return connector.ScalarFunction(query);
        }

        public string GetReplyMessage(int orderid)
        {
            string query = "SELECT FeedbackReply FROM FeedbackTable WHERE OrderID=" + orderid;
            return connector.ScalarFunction(query);
        }        

        public void SendReplyToCustomer(int orderid, string reply)
        {
            string saveReplyMessage = $"UPDATE FeedbackTable SET FeedbackReply='{reply}', " +
                $"FeedbackStatus='SellerReplied' WHERE OrderID=" + orderid;
            connector.NonQueryFunction(saveReplyMessage);

        }

    }
}
