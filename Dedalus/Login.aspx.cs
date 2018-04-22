using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration.Provider;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    static string path = Path.getPath();
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ValidateUser(object sender, EventArgs e)
    {
        Session["Username"] = txtLoginUsername.Text;
        Session["Userpassword"] = TxtLoginPassword.Text;
        // Server.Transfer("Login_success.aspx");

        //   Lines added for Salting
        System.Data.SqlClient.SqlConnection saltCon = new System.Data.SqlClient.SqlConnection(path);
        
        string saltCmdStr = "SELECT SaltGrain, HashValue, Password from Users WHERE UserName='" + txtLoginUsername.Text + "'";
        SqlCommand saltCmd = new SqlCommand(saltCmdStr, saltCon);
        saltCon.Open();
        SqlDataReader saltTableData = saltCmd.ExecuteReader();
        SaltCheck sc1 = new SaltCheck();
        if (saltTableData.HasRows)
        {
            while (saltTableData.Read())
            {
                sc1.saltGrain = saltTableData.GetInt32(0);
                sc1.hashValue = saltTableData.GetInt64(1);
                sc1.password = saltTableData.GetString(2);
                sc1.saltedPassword = sc1.password + sc1.saltGrain.ToString();
            }
            if (Math.Abs(sc1.saltedPassword.GetHashCode()) != sc1.hashValue)
            {
                lblLoginError.Visible = true;
                lblLoginError.Text = "Invalid salt credentials. Please try again";
                return;
            }
        }
        saltCon.Close();
        // ^ Lines added for Salting ^
        
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(path);
        string cmdStr = "select AccessLevel from Users where UserName='" + txtLoginUsername.Text + "' AND Password = '" + TxtLoginPassword.Text + "'";
        SqlCommand cmd = new SqlCommand(cmdStr, con);
        con.Open();
        Object AccessLevel = cmd.ExecuteScalar();
        con.Close();
        if (AccessLevel != null)
        {
            con.Open();
            string checkPassQuery = "SELECT * FROM Users WHERE username='" + txtLoginUsername.Text + "'";
            SqlCommand command = new SqlCommand(checkPassQuery, con);
            SqlDataReader tabledata = command.ExecuteReader();
            User current = new User();
            if (tabledata.HasRows)
            {
                while (tabledata.Read())
                {
                    current.userId = tabledata.GetInt32(0);
                    current.name = tabledata.GetString(1);
                    current.username = tabledata.GetString(2);
                    current.password = tabledata.GetString(3);
                    current.email = tabledata.GetString(4);
                    current.address = tabledata.GetString(5);
                    current.accessLevel = tabledata.GetInt32(6);

                    //   Lines added for Salting
                    current.saltGrain = tabledata.GetInt32(7);
                    current.hashValue = tabledata.GetInt64(8);
                    // ^ Lines added for Salting ^
                }
                tabledata.Close();
            }
            con.Close();
            if (current.password.Equals(Session["Userpassword"]))
            {
                Session["User"] = current;
                if (AccessLevel.ToString() == "2")
                {
                    Response.Redirect("~/Moderator/Login_success_moderator.aspx");
                }
                else if (AccessLevel.ToString() == "1")
                {
                    Response.Redirect("~/User/Login_success_user.aspx");
                }
                else
                {
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Invalid user credentials";
                }
            }
            else
            {
                lblLoginError.Visible = true;
                lblLoginError.Text = "Invalid user credentials. Please try again";
            }
        }
    }
}