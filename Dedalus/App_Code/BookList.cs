using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class BookList
{

    public List<Book> bList;

    public BookList()
    {
        bList = new List<Book>();
    }

    public void add(Book b)
    {
        bList.Add(b);
    }

    public static BookList getBookList()
    {
        BookList books = (BookList)HttpContext.Current.Session["Books"];
        if (books == null)
        {
            HttpContext.Current.Session["Books"] = new BookList();
        }

        return (BookList)HttpContext.Current.Session["Books"];
    }

}