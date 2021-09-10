using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.DynamicData;
using System.Text;

namespace WebApplication6
{
    public partial class EasySQL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cmdText = "SELECT * FROM Products";
            DataTable results = Search_Database(cmdText);
            if (results.Rows.Count >= 1)
            {
                GridView1.DataSource = results;
                GridView1.DataBind();
            }
        }

        protected void Input_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Input.Text))
            {
                string cmdText = "SELECT * FROM Products WHERE " + "Name LIKE '%" + Input.Text + "%'";
                DataTable results = Search_Database(cmdText);
                if (results.Rows.Count >= 1)
                {
                    GridView1.DataSource = results;
                    GridView1.DataBind();
                }
            } else
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Product field cannot be empty";
            }
        }

        private DataTable Search_Database(string cmdText)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand(cmdText, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable results = new DataTable();
            try
            {
                adapter.Fill(results);
            } catch
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Invalid SQL Statement.";
            }
            connection.Close();
            return results;
        }
    }
}