using System;
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
            this.displayUser();
        }
    }
    private void displayUser()
    {
        string usrname = "";
        for(int i = 0; i < u.uList.Count; i++)
        {
            usrname = u.uList[i].name;
        }

        username.Text = usrname;
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
