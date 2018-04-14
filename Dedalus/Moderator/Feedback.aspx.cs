using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string emailRegex = @"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$";
        Regex regex = new Regex(emailRegex);

        bool isValid = regex.IsMatch(txtEmail.Text);

        if (isValid)
        {
            txtEmail.CssClass = "feedbackInfo";
            return;
        }
        else
        {
            txtEmail.CssClass = "feedbackInfo error";
            return;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Response.Redirect("FeedbackSuccess.aspx");
        }
    }
}