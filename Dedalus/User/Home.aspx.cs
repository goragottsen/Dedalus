using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class _Default : System.Web.UI.Page
{

    Book b;

    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["user"];
        if (u != null)
        {
            string username = Session["username"].ToString();
            if (u.accessLevel == 1)
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

        Button btn = (Button)sender; // Get the button that raised the event

        GridViewRow gvr = (GridViewRow)btn.NamingContainer; // Get the row that contains this button

        Book book = new Book();
        // book.isbn = gvr.Cells[#].ToString();
        book.title = gvr.Cells[0].Text;
        book.author = gvr.Cells[1].Text;
        // book.publisher = gvr.Cells[#].ToString();
        // book.publicationYear = gvr.Cells[#].ToString();
        book.price = gvr.Cells[2].Text;
        // book.format = gvr.Cells[#].ToString();
        // book.genre = gvr.Cells[#].ToString();
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

        /*
        private Product GetSelectedProduct() // This is from chapter 15 of the "Textbook"
        {                                    // It was used as inspiration
      
            DataView productaTable = (DataView) SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            DataRowView row = (DataRowView)productaTable[0];
            Product p = new Product();
            p.ProductiD = row["ProductiD"].ToString();
            p.Name = row["Name"].ToString();
            p.ShortDescription = row["ShortDescription"].ToString();
            p.LongDescription = row["LongDescription"].ToString();
            p.UnitPrice = (decimal)row["UnitPrice"];
            p.ImageFile = row["ImageFile"].ToString();
            return p;
         }
         */

        BookList blist = BookList.getBookList();
        if (blist != null)
        {
            blist.add(book);
            Response.Redirect("Cart.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        /* 
        
        // This was all put in previously for testing purposes

        Book book = new Book();

        DataView bookView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        // bookView.RowFilter = "Title = '" + book.title + "'";
        DataTable bookTable = bookView.ToTable();
        string request = "Title = '" + "Buness Driven Information" + "'";
        DataRow[] bookRow = bookTable.Select(request);
        // string s = bookTable.ToString();
        string s = "";
        // s = s + bookRow[0];
        // s = s + bookRow.Length;

        book.isbn = bookRow[0]["ISBN"].ToString();
        book.title = bookRow[0]["Title"].ToString();
        book.author = bookRow[0]["Author"].ToString();
        book.publisher = bookRow[0]["Publisher"].ToString();
        book.publicationYear = bookRow[0]["PublicationYear"].ToString();
        book.price = bookRow[0]["Price"].ToString();
        book.format = bookRow[0]["Format"].ToString();
        book.genre = bookRow[0]["Genre"].ToString();
        book.location = bookRow[0]["Location"].ToString();

        s = s + book.isbn + book.title + book.author + book.publisher + book.publicationYear + book.price + book.format + book.genre + book.location;
   
        lblTest.Text = s;
        */

        return;
    } 

}