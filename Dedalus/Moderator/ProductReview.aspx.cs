using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmitReview_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Response.Redirect("FeedbackSuccess.aspx");
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.UrlReferrer.ToString());
    }
}