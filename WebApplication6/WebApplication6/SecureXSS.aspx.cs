using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class SecureXSS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UserName_Label.Text = "";
                ProductName_TextBox.MaxLength = 100;
                Price_TextBox.MaxLength = 7;
                Quantity_TextBox.MaxLength = 3;
            }
            String name = HttpUtility.ParseQueryString(Request.Url.Query).Get("name");
            if (!String.IsNullOrEmpty(name))
            {
                UserName_Label.Visible = true;
                UserName_Label.Text = "Hello " + Server.HtmlEncode(name) + ", welcome to VulnWeb!";
            }
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM Products", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable results = new DataTable();
            adapter.Fill(results);
            if (results.Rows.Count >= 1)
            {
                GridView1.DataSource = results;
                GridView1.DataBind();
            }
            connection.Close();
        }

        protected void Reflected_Button_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(UserName_TextBox.Text))
            {
                Info_Label.Visible = false;
                Response.Redirect("https://localhost:44374/SecureXSS.aspx?name=" + Server.HtmlEncode(UserName_TextBox.Text));
                UserName_TextBox.Text = "";
            }
            else
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Name cannot be empty.";
            }
        }

        protected void Persistent_Button_Click(object sender, EventArgs e)
        {
            float price;
            int quantity;
            if (is_valid(ProductName_TextBox.Text, Price_TextBox.Text, Quantity_TextBox.Text))
            {
                Info_Label.Visible = false;
                float.TryParse(Price_TextBox.Text, out price);
                Int32.TryParse(Quantity_TextBox.Text, out quantity);
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter();
                String cmdText = "INSERT INTO Products (Name, Price, Quantity) VALUES (@name, @price, @quantity)";
                SqlCommand command = new SqlCommand(cmdText, connection);
                command.Parameters.AddWithValue("@name", ProductName_TextBox.Text);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@quantity", quantity);
                command.ExecuteNonQuery();
                connection.Close();
                ProductName_TextBox.Text = "";
                Price_TextBox.Text = "";
                Quantity_TextBox.Text = "";
                Page_Load(sender, e);
            }
        }

        private bool is_valid(String s_name, String s_price, String s_quantity)
        {
            float price;
            int quantity;
            if ((String.IsNullOrEmpty(s_name)))
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Name cannot be empty.";
                return false;
            }
            else if ((s_price.Equals("")) || (!float.TryParse(s_price, out price)))
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Price cannot be empty or be not a float.";
                return false;
            }
            else if ((s_quantity.Equals("")) || (!Int32.TryParse(s_quantity, out quantity)))
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Quantity cannot be empty or be not an integer.";
                return false;
            }
            else
            {
                Info_Label.Visible = false;
                return true;
            }
        }
    }
}