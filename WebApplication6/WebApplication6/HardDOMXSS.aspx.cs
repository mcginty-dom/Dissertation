using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class HardDOMXSS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String house = HttpUtility.ParseQueryString(Request.Url.Query).Get("house");
            if (!String.IsNullOrEmpty(house))
            {
                if (!(house.Equals("Gryffindor") || house.Equals("Hufflepuff") || house.Equals("Ravenclaw") || house.Equals("Slytherin")))
                {
                    Response.Redirect("https://localhost:44374/HardDOMXSS.aspx?house=Gryffindor");
                }
            }
        }

        protected void Easy_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44374/DOMXSS.aspx");
        }
    }
}