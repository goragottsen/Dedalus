using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Globalization;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["user"];
        if (u != null)
        {
            string username = Session["username"].ToString();
            if (u.accessLevel == 1)
            {
                Page.Visible = true;
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
        User u = (User)Session["user"];
        if (IsValid)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source = (LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename = |DataDirectory|\\Dedalus.mdf;" + "Integrated Security = True;";
            // conn.Open();

            SqlCommand command = conn.CreateCommand();
            Feedback feedback = new Feedback();
            feedback.comment = txtComments.Text;
            feedback.date = DateTime.Now.ToString();
            feedback.rating = rbPgRating.SelectedIndex;
            feedback.device = cbDeviceUsage.SelectedValue.ToString();
            feedback.userId = u.userId;
        

            command.CommandText = "INSERT INTO Feedback (ISBN, UserId, Date, Rating, Comment, Device) VALUES ('" + 0 + "', '" + feedback.userId + "', '" + feedback.date + "', '" + feedback.rating + "', '" + feedback.comment + "', '" + feedback.device + "');";
            command.Connection = conn;
            command.Connection.Open();
            command.ExecuteNonQuery();
        
            Response.Redirect("FeedbackSuccess.aspx");
        }
    }
}