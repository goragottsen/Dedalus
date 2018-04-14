using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



public partial class _Default : System.Web.UI.Page
{

    Book b;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddToCartClick(object sender, System.EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        return;
    } 

}