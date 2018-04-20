﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;


/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int userId;
    public string name;
    public string username;
    public string password;
    public string email;
    public string address;
    public int accessLevel;
    public int isInRole;

    public static bool isUser;
    public static bool isModerator;

    public User()
    {
   
    }
    public string getUsername()
    {
        return username;
    }
}