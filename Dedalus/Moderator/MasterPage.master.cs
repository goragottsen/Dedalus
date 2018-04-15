﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    UserList u;
    protected void Page_Load(object sender, EventArgs e)
    {
        u = UserList.getUserList();
        if (!IsPostBack)
        {
            this.displayUserName();
            this.setActiveLink();
        }
    }
    private void displayUserName()
    {
        username.Text = Session["Username"].ToString();
    }
    public void setActiveLink()
    {
        switch (Page.Title)
        {
            case "Home":
                home.Attributes.Add("class", "nav-link active");
                break;
            case "Information":
                information.Attributes.Add("class", "nav-link active");
                break;
            case "Feedback":
                feedback.Attributes.Add("class", "nav-link active");
                break;
            case "About":
                about.Attributes.Add("class", "nav-link active");
                break;
            case "Feedback List":
                flist.Attributes.Add("class", "nav-link active");
                break;
            case "User List":
                ulist.Attributes.Add("class", "nav-link active");
                break;
            case "Transaction List":
                tlist.Attributes.Add("class", "nav-link active");
                break;
        }
    }

    //protected void TextBox1_TextChanged(object sender, EventArgs e)
    //{

    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //}

    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //}


}
