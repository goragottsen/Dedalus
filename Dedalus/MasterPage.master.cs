using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.setActiveLink();
        }
    }

    public void setActiveLink()
    {
        switch (Page.Title)
        {
            case "Home":
                homev.Attributes.Add("class", "nav-link active");
                break;
            case "Information":
                informationv.Attributes.Add("class", "nav-link active");
                break;
            case "About":
                aboutv.Attributes.Add("class", "nav-link active");
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
