using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args) //serverside validation of username
    {
        string username = args.Value;
        args.IsValid = false; //reject if char does not meet criteria

        for (int i = 0; i < username.Length; i++)
        {
            if (isNumber(username[i])) //check for number
            {
                continue;
            }
            else if (isUppercase(username[i])) //check for uppercase
            {
                continue;
            }
            else if (isLowercase(username[i])) //check for lowercase
            { 
                continue;
            }
            else
            {
                return;
            }
        }
        args.IsValid = true; //accept if no problems found

    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args) //serverside validation for password
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
    //Database validation:
    //Loop through emails in db to check if the user exists

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(IsValid)
        {
            SqlDataSource1.Insert();
            Server.Transfer("Login.aspx");
        }
        
        
    }

    protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DataView dv =(DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Count == 0) //check if SQL query (checking for dupe email) returns rows
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
}
