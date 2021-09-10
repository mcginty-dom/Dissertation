using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;
using System.Security.AccessControl;

namespace WebApplication6
{
    public partial class PersistentXSS : System.Web.UI.Page
    {
        protected override void Render(HtmlTextWriter writer)
        {
            //Used to undo built-in XSS protection
            StringBuilder buildString = new StringBuilder();
            StringWriter writeString = new StringWriter(buildString);
            HtmlTextWriter hWriter = new HtmlTextWriter(writeString);
            base.Render(hWriter);
            string html = buildString.ToString();
            html = Server.HtmlDecode(html);
            writer.Write(html);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Name_TextBox.MaxLength = 100;
                Price_TextBox.MaxLength = 7;
                Quantity_TextBox.MaxLength = 3;
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
        protected void Easy_Button_Click(object sender, EventArgs e)
        {
            float price;
            int quantity;
            if (is_valid(Name_TextBox.Text, Price_TextBox.Text, Quantity_TextBox.Text))
            {
                Info_Label.Visible = false;
                float.TryParse(Price_TextBox.Text, out price);
                Int32.TryParse(Quantity_TextBox.Text, out quantity);
                create_product(Name_TextBox.Text, price, quantity);
                Name_TextBox.Text = "";
                Price_TextBox.Text = "";
                Quantity_TextBox.Text = "";
                Page_Load(sender, e);
            } 
        }

        protected void Hard_Button_Click(object sender, EventArgs e)
        {
            float price;
            int quantity;
            if (!is_valid(Name_TextBox1.Text, Price_TextBox1.Text, Quantity_TextBox1.Text))
            {

            } else if (Name_TextBox1.Text.Contains("<script>")) //lower case solution
            {
                Name_TextBox1.Text = Name_TextBox1.Text.Replace("<script>", "");
                Name_TextBox1.Text = Name_TextBox1.Text.Replace("</script>", "");
                Info_Label.Visible = true;
                Info_Label.Text = "Lower case script tag detected!";
            }
            else if (Name_TextBox1.Text.Contains("<SCRIPT>")) //upper case solution
            {
                Name_TextBox1.Text = Name_TextBox1.Text.Replace("<SCRIPT>", "");
                Name_TextBox1.Text = Name_TextBox1.Text.Replace("</SCRIPT>", "");
                Info_Label.Visible = true;
                Info_Label.Text = "Upper case SCRIPT tag detected!";
            }
            else if (Name_TextBox1.Text.ToLower().Contains("<script>")) //mixed case solution
            {
                //maybe use IndexOf and replace that section with blank and swap back?
                Name_TextBox1.Text = Name_TextBox1.Text.ToLower().Replace("<script>", "");
                Name_TextBox1.Text = Name_TextBox1.Text.ToLower().Replace("</script>", "");
                Info_Label.Visible = true;
                Info_Label.Text = "Mixed case script tag detected!";
            }
            else
            {
                Info_Label.Visible = false;
                float.TryParse(Price_TextBox1.Text, out price);
                Int32.TryParse(Quantity_TextBox1.Text, out quantity);
                create_product(Name_TextBox1.Text, price, quantity);
                Name_TextBox1.Text = "";
                Price_TextBox1.Text = "";
                Quantity_TextBox1.Text = "";
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

        private void create_product(String name, float price, int quantity)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            String cmdText = "INSERT INTO Products (Name, Price, Quantity) VALUES (@name, @price, @quantity)";
            SqlCommand command = new SqlCommand(cmdText, connection);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@price", price);
            command.Parameters.AddWithValue("@quantity", quantity);
            try
            {
                command.ExecuteNonQuery();
            } catch
            {
                Info_Label.Visible = true;
                Info_Label.Text = "Duplicate entry detected.";
            }
            connection.Close();
        }
    }
}