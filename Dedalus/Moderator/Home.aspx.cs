using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Data.SqlClient;
using System.Security.Principal;




public partial class _Default : System.Web.UI.Page
{    
    Book b;   

    protected void Page_Load(object sender, EventArgs e)
    {        
        User u = (User)Session["user"];
        if (u != null)
        {
            string username = Session["username"].ToString();
            if(u.accessLevel == 2)
            {
                Page.Visible = true;
                if (!Page.IsPostBack)
                {
                    GridView1.DataBind();
                }
            }
            else
            {
                Page.Visible = false;
                Response.Redirect("~/Login.aspx");
            }
        }
        else
        {
            Page.Visible = false;
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void AddToCartClick(object sender, System.EventArgs e)
    {
        
        Button btn = (Button)sender;// Get the button that raised the event

        GridViewRow gvr = (GridViewRow)btn.NamingContainer; // Get the row that contains this button

        Book book = new Book();
        // book.isbn = gvr.Cells[#].ToString();
        book.title = gvr.Cells[0].Text;
        book.author = gvr.Cells[1].Text;
        // book.publisher = gvr.Cells[#].ToString();
        // book.publicationYear = gvr.Cells[#].ToString();
        book.price = gvr.Cells[2].Text;
        // book.genre = gvr.Cells[#].ToString();
        // book.format = gvr.Cells[#].ToString();
        // book.location = gvr.Cells[#].ToString();

        DataView bookView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty); // Get the result set from the SQL Data Source

        DataTable bookTable = bookView.ToTable(); // Get the result set into a Data Table with all rows present

        string request = "Title = '" + book.title + "'"; // Creation of a SELECT statement

        DataRow[] bookRow = bookTable.Select(request); // Filter rows via the SELECT statement and assign it to a Data Row object

        book.isbn = bookRow[0]["ISBN"].ToString(); // Assign missing values to the Book from the Data Row object
        // book.title = bookRow[0]["Title"].ToString();
        // book.author = bookRow[0]["Author"].ToString();
        book.publisher = bookRow[0]["Publisher"].ToString();
        book.publicationYear = bookRow[0]["PublicationYear"].ToString();
        // book.price = bookRow[0]["Price"].ToString();
        book.format = bookRow[0]["Format"].ToString();
        book.genre = bookRow[0]["Genre"].ToString();
        book.location = bookRow[0]["Location"].ToString();

        BookList blist = BookList.getBookList();
        if (blist != null)
        {
            blist.add(book);
            Response.Redirect("Cart.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        return;
    }


    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if(e.Exception != null)
        {
            lblError.Text = "A database error has occurred";
            e.ExceptionHandled = true;
        }
        else
        {
            if(e.AffectedRows == 0)
            {
                lblError.Text = " Book is not deleted. Someone may have already deleted it already.";
            }
            else
            {
                lblError.Text = "Database is successfully updated.";
            }
        }
    }

    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred";
            e.ExceptionHandled = true;
        }
        else
        {
            if (e.AffectedRows == 0)
            {
                lblError.Text = " Book is not updated. Someone may have already updated it already.";
            }
            else
            {
                lblError.Text = "Database is successfully updated.";
            }
        }
    }
}