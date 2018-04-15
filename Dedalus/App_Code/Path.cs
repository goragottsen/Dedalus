using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Path
{
    private static string dbPath = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Dedalus.mdf;Integrated Security=True;Connect Timeout=30";
    public Path()
    {       

    }
    public static string getPath()
    {
        return dbPath;
    }
}