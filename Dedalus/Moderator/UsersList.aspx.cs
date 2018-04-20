using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Moderator_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["user"];
        if (u != null)
        {
            string username = Session["username"].ToString();
            if (u.accessLevel == 2)
            {
                Page.Visible = true;
                if (!Page.IsPostBack)
                {
                    GridView1.DataBind();
                }
            }
            else
            {
                Page.Visible = false;
                Response.Redirect("~/Login.aspx");
            }
        }
        else
        {
            Page.Visible = false;
            Response.Redirect("~/Login.aspx");
        }
    }
}