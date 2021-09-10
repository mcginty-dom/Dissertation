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
    public partial class SecureSQL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Search_All();
            }
        }

        protected void Input_TextChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            if (!String.IsNullOrWhiteSpace(Input.Text))
            {
                string cmdText = "SELECT * FROM Products WHERE Name LIKE '%' + @name + '%'";
                SqlCommand command = new SqlCommand(cmdText, connection);
                command.Parameters.AddWithValue("@name", Input.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable results = new DataTable();
                try
                {
                    adapter.Fill(results);
                }
                catch
                {
                    Info_Label.Visible = true;
                    Info_Label.Text = "Invalid SQL Statement.";
                }
                if (results.Rows.Count >= 1)
                {
                    GridView1.DataSource = results;
                    GridView1.DataBind();
                }
            } else
            {
                Search_All();
            }
            connection.Close();
        }

        private void Search_All()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            String cmdText = "SELECT * FROM Products";
            SqlCommand command = new SqlCommand(cmdText, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable results = new DataTable();
            try
            {
                adapter.Fill(results);
            } catch
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Products table is empty.";
            }
            if (results.Rows.Count >= 1)
            {
                GridView1.DataSource = results;
                GridView1.DataBind();
            }
        }
    }
}