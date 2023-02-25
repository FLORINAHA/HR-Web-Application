using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Image1.ImageUrl = "~/pic/logo.png";
            Image2.ImageUrl = "~/pic/logo3.png";
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime data = DateTime.Now;
        lblData.Text = data.ToString();

        Random rand = new Random();
        int i = rand.Next(1, 4);
        int j = rand.Next(0, 3);

        string[] sir = new string[100];
        sir[0] = "logo.png";
        sir[1] = "logo2.png";
        sir[2] = "logo3.png";
        Image1.ImageUrl = "~/pic/" + sir[i - 1];
        Image2.ImageUrl = "~/pic/" + sir[j];
    }
}