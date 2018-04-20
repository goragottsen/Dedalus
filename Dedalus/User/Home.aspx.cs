using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



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

}