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

    }
    protected void FeedbackDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        lblMsgs.Text = "";
        if (e.Exception != null)
        {
            lblMsgs.Text = "Deletion of entry failed!";
            e.ExceptionHandled = true;
        }
        else
        {
            lblMsgs.Text = "Deletion successful!";
            FeedbackData.DataBind();
        }
        if(e.AffectedRows==0)
        {
            lblMsgs.Text = "Unable to delete entry.  It may have already been deleted!";
            FeedbackData.DataBind();
        }
    }
}
