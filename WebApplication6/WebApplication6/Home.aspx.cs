using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace WebApplication6
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ResetDB_Button_Click(object sender, EventArgs e)
        {
            //Create, Read, Update, Delete
            //Drop all existing tables
            delete_all();
            //Create accounts
            create_table("Accounts", "[email] NVARCHAR(100) NOT NULL, [password] NVARCHAR(100) NOT NULL, [first_name] NVARCHAR(100) NOT NULL, [last_name] NVARCHAR(100) NOT NULL, " +
                "[mobile_number] NVARCHAR(16) NULL, [card_number] NVARCHAR(4) NULL, [cvv] NVARCHAR(3) NULL,", "email");
            create_table("Products", "[Name] NVARCHAR(100) NOT NULL, [Price] NVARCHAR(7) NOT NULL, [Quantity] NVARCHAR(3) NOT NULL,", "Name");
            //Insert dummy accounts (email, password, first_name, last_name, mobile_number, card_number, CVV)
            create_account("admin@vulnweb.co.uk", "21232F297A57A5A743894A0E4A801FC3", "Dominic", "McGinty", "01613894828", "1234", "567");
            create_account("p.d.james@swansea.ac.uk", "C21F969B5F03D33D43E04F8F136E7682", "Phillip", "James", "05239391846", "4354", "343");
            create_account("xiuyi.fan@swansea.ac.uk", "1A1DC91C907325C69271DDF0C944BC72", "Xiuyi", "Fan", "04933920358", "3456", "654");
            //Insert dummy products (name, price, quantity)
            create_product("Claw Hammer", "5.0000", "47");
            create_product("Hammer", "8.0000", "34");
            create_product("Ruler", "3.5000", "15");
            create_product("Clown Shoes", "6.0000", "2");
            create_product("Hard Hat", "25.9900", "26");
        }
        
        private void delete_table(String table_name)
        {
            if (table_name != "Table")
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                connection.Open();
                String cmdText = "DROP TABLE " + table_name;
                SqlCommand command = new SqlCommand(cmdText, connection);
                try
                {
                    command.ExecuteNonQuery();
                }
                catch
                {
                    Info_Label.Visible = true;
                    Info_Label.Text = table_name + " table has already been dropped.";
                }
                connection.Close();
            }
        }

        private void delete_all()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            String cmdText = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES";
            SqlCommand command = new SqlCommand(cmdText, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable results = new DataTable();
            adapter.Fill(results);
            connection.Close();
            for (int i = 0; i < results.Rows.Count; i++)
            {
                delete_table(results.Rows[i].Field<string>(0));
            }
        }

        private void execute_cmdText(String cmdText)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand(cmdText, connection);
            command.ExecuteNonQuery();
            connection.Close();
        }

        private void create_table(String name, String fields, String primary_key)
        {
            String cmdText = "CREATE TABLE " + name + " ( " + fields + " PRIMARY KEY CLUSTERED ("+primary_key+" ASC) )";
            execute_cmdText(cmdText);
        }

        private void create_account(String email, String password, String first_name, String last_name, String mobile_number, String card_number, String cvv)
        {
            String cmdText = "INSERT INTO Accounts (email, password, first_name, last_name, mobile_number, card_number, cvv) " + "VALUES ('"+email+ "', '" 
                + password + "', '" + first_name + "', '" + last_name + "', '" + mobile_number + "', '" + card_number + "', '" + cvv + "')";
            execute_cmdText(cmdText);
        }

        private void create_product(String name, String price, String quantity)
        {
            String cmdText = "INSERT INTO Products (Name, Price, Quantity) VALUES ('"+name+ "', " + price + ", " + quantity + ")";
            execute_cmdText(cmdText);
        }
    }
}