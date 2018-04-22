using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    // Reminder to self, you'll need to implement a way to remove entries from the cart if the user doesn't want them.
    // (Maybe dynamically loading check-boxes or something... Or just links and anchor tags. Amazon uses links and anchor tags)
    // This is in addition to just carrying everything over to a "Checkout" page.

    BookList bookList;

    protected void Page_Load(object sender, EventArgs e)
    {
        bookList = BookList.getBookList();
        User u = (User)Session["user"];
        if (u != null)
        {
            string username = Session["username"].ToString();
            if (u.accessLevel == 1)
            {
                Page.Visible = true;
                if (!IsPostBack)
                {
                    this.displayBooks();
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

    private void displayBooks()
    {
        if (BookList.getBookList() != null) { 
            string content = "";

            for (int i = 0; i < bookList.bList.Count; i++)
            {
                content = content + bookList.bList[i].title + ". By: " + bookList.bList[i].author + ". Price: $" + bookList.bList[i].price + "\n";
            }

            tbCart.Text = content;
        }
        else
        {
            tbCart.Text = "";
        }
    }

    protected void btnBackToStore_Click(object sender, EventArgs e)
    {
        Server.Transfer("Home.aspx"); 
    }

    protected void btnClearCart_Click(object sender, EventArgs e)
    {
        // Initial way of clearing the cart.
        clearCart();

    }
    public void clearCart()
    {
        tbCart.Text = "";
        bookList.bList.Clear();
    }
    protected void btnCartToCheckout_Click(object sender, EventArgs e)
    {
        Server.Transfer("CheckOut.aspx");
    }
}