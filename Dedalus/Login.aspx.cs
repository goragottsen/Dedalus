using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration.Provider;

public partial class _Default : System.Web.UI.Page
{

    static string path = Path.getPath();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Session["Username"] = txtLoginUsername.Text;
            // Server.Transfer("Login_success.aspx");
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(path);
            string cmdStr = "select AccessLevel from Users where UserName='" + txtLoginUsername.Text + "' AND Password = '" + TxtLoginPassword.Text + "'";

            SqlCommand cmd = new SqlCommand(cmdStr, con);
            con.Open();
            Object AccessLevel = cmd.ExecuteScalar(); 
            con.Close();
            if (AccessLevel != null)
            {
                lblLoginError.Visible = false;
                if (AccessLevel.ToString() == "2")
                {
                    Response.Redirect("~/Moderator/Home.aspx");
                }
                else if (AccessLevel.ToString() == "1")
                {
                    Response.Redirect("~/User/Home.aspx");
                }
                else
                {
                    lblLoginError.Text = "Invalid user type";
                }
            }
            else
            {
                lblLoginError.Visible = true;
                lblLoginError.Text = "Invalid Credentials Entered. Try again";
            }            
        }
    }
}