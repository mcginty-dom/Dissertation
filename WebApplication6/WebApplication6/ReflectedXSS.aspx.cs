using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Name_Label.Text = "";
            }
            String name = HttpUtility.ParseQueryString(Request.Url.Query).Get("name");
            if (!String.IsNullOrEmpty(name))
            {
                Name_Label.Visible = true;
                Name_Label.Text = "Hello " + name + ", welcome to VulnWeb!";
            }
            
            

        }

        protected void Easy_Button_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Easy_TextBox.Text)) {
                Info.Visible = false;
                Response.Redirect("https://localhost:44374/ReflectedXSS.aspx?name=" + Easy_TextBox.Text);
                Easy_TextBox.Text = "";
            } else
            {
                Info.Visible = true;
                Info.Text = "Name cannot be empty.";
            }
        }

        protected void Hard_Button_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Hard_TextBox.Text)) {
                if (Hard_TextBox.Text.Contains("<script>")) //lower case solution
                {
                    Hard_TextBox.Text = Hard_TextBox.Text.Replace("<script>", "");
                    Hard_TextBox.Text = Hard_TextBox.Text.Replace("</script>", "");
                    Info.Visible = true;
                    Info.Text = "Lower case script tag detected!";
                }
                else if (Hard_TextBox.Text.Contains("<SCRIPT>")) //upper case solution
                {
                    Hard_TextBox.Text = Hard_TextBox.Text.Replace("<SCRIPT>", "");
                    Hard_TextBox.Text = Hard_TextBox.Text.Replace("</SCRIPT>", "");
                    Info.Visible = true;
                    Info.Text = "Upper case SCRIPT tag detected!";
                }
                else if (Hard_TextBox.Text.ToLower().Contains("<script>")) //mixed case solution
                {
                    //maybe use IndexOf and replace that section with blank and swap back?
                    Hard_TextBox.Text = Hard_TextBox.Text.ToLower().Replace("<script>", "");
                    Hard_TextBox.Text = Hard_TextBox.Text.ToLower().Replace("</script>", "");
                    Info.Visible = true;
                    Info.Text = "Mixed case script tag detected!";
                }
                else
                {
                    Info.Visible = false;
                    Response.Redirect("https://localhost:44374/ReflectedXSS.aspx?name=" + Hard_TextBox.Text);
                    Hard_TextBox.Text = "";
                }
            } else
            {
                Info.Visible = true;
                Info.Text = "Name cannot be empty.";
            }
            
        }
    }
}