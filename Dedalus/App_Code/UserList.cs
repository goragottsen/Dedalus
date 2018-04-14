using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UserList
{
    public List<User> uList;
    public UserList()
    {
        uList = new List<User>();
    }
    public void add(User u)
    {
        uList.Add(u);
    }
    public static UserList getUserList()
    {
        UserList usr = (UserList)HttpContext.Current.Session["User"];
        if(usr == null)
        {
            HttpContext.Current.Session["User"] = new UserList();
        }
        return (UserList)HttpContext.Current.Session["User"];
    }
    
}