using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;

namespace DAL
{
    public class ConnectionClass
        {
            SqlConnection connection;
            SqlCommand command;
        DataContext dataContext;

        public ConnectionClass()
            {
                connection = new SqlConnection(@"server=GOKU\SQLEXPRESS;database=ECOMMERCEDB;
Integrated Security=true;");

            dataContext = new DataContext(@"data source=GOKU\SQLEXPRESS;initial catalog=ECOMMERCEDB;
integrated security=true;");
        }

            public int NonQueryFunction(string sqlquery)
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                command = new SqlCommand(sqlquery, connection);
                connection.Open();
                int i = command.ExecuteNonQuery();
                connection.Close();
                return i;
            }

            public string ScalarFunction(string sqlquery)
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                command = new SqlCommand(sqlquery, connection);
                connection.Open();
            string s = "";
            if (command.ExecuteScalar().ToString() == null) 
            {
                connection.Close();
                return s;
            }
            else
            {
                
                s = command.ExecuteScalar().ToString();
                connection.Close();
                return s;
            }
                
     
            }

            public SqlDataReader ReaderFunction(string sqlquery)
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                command = new SqlCommand(sqlquery, connection);
                connection.Open();
                SqlDataReader dataReader = command.ExecuteReader();
                return dataReader;
            }

            public DataSet DataSetFunction(string sqlquery)
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlquery, connection);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                return dataSet;
            }

            public DataTable DataTableFunction(string sqlquery)
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlquery, connection);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                return dataTable;
            }


        public string ScalarFunctionUsingSP(SqlCommand cmd)
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
            cmd.Connection = connection;
            connection.Open();
            string s = "";
            if (cmd.ExecuteScalar().ToString() == null)
            {
                connection.Close();
                return s;
            }
            else
            {

                s = cmd.ExecuteScalar().ToString();
                connection.Close();
                return s;
            }
        }


        public void NonQueryFunctionUsingSP(SqlCommand cmd)
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
            cmd.Connection = connection;
            connection.Open();
            int i = cmd.ExecuteNonQuery();
            connection.Close();
           
        }


        public Table<Orders> GetOrderTable()
        {
            return dataContext.GetTable<Orders>();
        }

        public void SubmitOrder()
        {
            dataContext.SubmitChanges();
        }
    }
}
