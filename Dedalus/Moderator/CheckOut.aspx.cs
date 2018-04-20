using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Data.SqlClient;

public partial class User_Default : System.Web.UI.Page
{

    BookList bookList;
    string content = "";
    string strHST = " (13%)";
    double subT = 0.00d;
    double doubleHST = 0.13d;
    double total = 0.00d;
    User currentUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        bookList = BookList.getBookList();

        if (!IsPostBack)
        {
            this.displayCart();
        }

    }

    private void displayCart()
    {

        for (int i = 0; i < bookList.bList.Count; i++)
        {
            content = content + bookList.bList[i].title + ". By: " + bookList.bList[i].author + ". Price: $" + bookList.bList[i].price + " ISBN: (" + bookList.bList[i].isbn + ")" + "\n";
        }

        tbCheckOut.Text = content;

        for (int i = 0; i < bookList.bList.Count; i++)
        {
            subT = subT + Double.Parse(bookList.bList[i].price);
        }

        lblSubTotal.Text = "$" + subT.ToString();
        lblHstAmount.Text = "$" + Math.Round((subT * doubleHST), 2) + strHST;
        total = subT * (1 + doubleHST);
        total = Math.Round(total, 2);
        lblPurchaseTotal.Text = "$" + total.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("Cart.aspx");
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        float totalFloat = 0.0F;
        DataView bookView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty); // Get the result set from the SQL Data Source
        bookView.AllowNew = true;
        DataRowView bookRowView = bookView.AddNew();

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source = (LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename = |DataDirectory|\\Dedalus.mdf;" + "Integrated Security = True;";
        // conn.Open();
        SqlCommand command = conn.CreateCommand();

        // bookList.bList[i].title
        bookRowView["Date"] = DateTime.Now;
        // bookRowView["Date"] = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt");
        bookRowView["InvoiceTotal"] = total;
        bookRowView["PaymentTotal"] = total;
        bookRowView["PaymentDate"] = DateTime.Now;
        // bookRowView["PaymentDate"] = DateTime.Now.ToString("dd/mm/yyyy hh:mm:ss tt");

        /*
        var bookRow = bookTable.NewRow();
        bookRow["Date"] = DateTime.Now.ToString();
        bookRow["InvoiceTotal"] = total;
        bookRow["PaymentTotal"] = total;
        bookRow["PaymentDate"] = DateTime.Now.ToString();
        bookTable.Rows.Add(bookRow);
        */

        if (currentUser == null || currentUser.userId == null || currentUser.userId == 0)
        {
            bookRowView["UserID"] = 1;
            //bookRow["UserID"] = 1;
        }
        else
        {
            bookRowView["UserID"] = currentUser.userId;
            //bookRow["UserID"] = currentUser.userId;
        }

        for (int i = 0; i < bookList.bList.Count; i++)
        {
            totalFloat = totalFloat + float.Parse(bookList.bList[i].price);
        }

        totalFloat = totalFloat * 1.13F;

        // command.CommandType = System.Data.CommandType.Text;
        command.CommandText = "INSERT INTO Invoices (UserID, InvoiceTotal, PaymentTotal) VALUES ('" + bookRowView["UserID"] + "', '" + totalFloat + "', '" + totalFloat + "');";
        // command.CommandText = "INSERT INTO Invoices (UserID, Date, InvoiceTotal, PaymentTotal, PaymentDate) VALUES ('" + bookRowView["UserID"] + "', '" + "20/04/2018 10:10:10 AM" + "', '" + totalFloat + "', '" + totalFloat + "', '" + "20/04/2018 10:10:10 AM" + "');";
        // command.CommandText = "INSERT INTO Invoices (UserID, Date, InvoiceTotal, PaymentTotal, PaymentDate) VALUES ('" + bookRowView["UserID"] + "', 'CONVERT(datetime, " + bookRowView["Date"] + ", 131)', '" + totalFloat + "', '" + totalFloat + "', 'CONVERT(datetime, " + bookRowView["PaymentDate"] + ", 131)');";
        // command.CommandText = "INSERT INTO Invoices (UserID, Date, InvoiceTotal, PaymentTotal, PaymentDate) VALUES ('" + bookRowView["UserID"] + "', '" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt") + "', '" + totalFloat + "', '" + totalFloat + "', '" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt") + "');";

        command.Connection = conn;
        command.Connection.Open();
        command.ExecuteNonQuery();
        // conn.Close();
        bookRowView.EndEdit();
        // Server.Transfer("~/Moderator/TransactionsList.aspx");
        Response.Redirect("~/Moderator/TransactionsList.aspx");

        /*
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
        */
    }
}