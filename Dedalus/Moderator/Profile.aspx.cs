using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
                    displayUserName();
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
        //need code to load profile info and avatar from database
        
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string password = args.Value;
        bool hasLower = false;
        bool hasUpper = false;
        bool hasNum = false;

        if (6 > password.Length || password.Length > 20) //check length, reject if less than 6 or greater than 20 chars
        {
            args.IsValid = false;
            return;
        }

        for (int i = 0; i < password.Length; i++)
        {
            if (isNumber(password[i])) //check if number, fulfill number requirement if true
            {
                hasNum = true;
            }
            else if (isUppercase(password[i])) //check if uppercase, fulfill upper requirement if true
            {
                hasUpper = true;
            }
            else if (isLowercase(password[i])) //check if lowercase, fulfill lower requirement if true
            {
                hasLower = true;
            }
        }
        if (hasNum == true && hasUpper == true && hasLower == true) //ensure all requirements are met
        {
            args.IsValid = true;
        }
        else //reject if requirements are not met
        {
            args.IsValid = false;
        }
    }

    protected bool isNumber(char c) //function for checking if a char is a number
    {
        string nums = "1234567890"; //string containing valid chars
        return nums.Contains(c);
    }

    protected bool isUppercase(char c) //check if char is uppercase letter
    {
        string uppers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //string containing valid chars
        return uppers.Contains(c);
    }

    protected bool isLowercase(char c) //check if char is lowercase letter
    {
        string lowers = "abcdefghijklmnopqrstuvwxyz";
        return lowers.Contains(c);
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        //need code to commit password change to database
    }
    private void displayUserName()
    {
        username.Text = Session["Username"].ToString();
    }
}