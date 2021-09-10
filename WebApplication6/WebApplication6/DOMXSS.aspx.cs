using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class DOMXXS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Create cookie example for XSS exploit
            HttpCookie VulnWeb = new HttpCookie("VulnWeb");
            Random CookieGenerator = new Random();
            String SESSIONID = $"0x{CookieGenerator.Next(100000,1000000):X}";
            VulnWeb.Values.Add("SESSIONID", SESSIONID);
            Response.Cookies.Add(VulnWeb);
        }

        protected void Hard_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44374/HardDOMXSS.aspx");
        }
    }
}