<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 403px;
        }
        .auto-style3 {
            width: 368px;
        }
        .auto-style4 {
            width: 403px;
            height: 26px;
        }
        .auto-style5 {
            width: 368px;
            height: 26px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Check Out Page</h1>
    <div>
    <p>Click here to return to Cart. &nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Back to Cart" OnClick="Button1_Click" /></p>
    
    </div>
    <asp:TextBox ID="tbCheckOut" runat="server" Height="200px" Width="700px" TextMode="MultiLine">This Check-Out is Currently Empty.></asp:TextBox>
    <div>
    <table class="w-100">
        <tr>
            <td class="auto-style2">&nbsp;Sub-Total:&nbsp;</td>
            <td class="auto-style3">
                <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;HST:&nbsp;</td>
            <td class="auto-style5">
                <asp:Label ID="lblHstAmount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;Purchase Total:&nbsp;</td>
            <td class="auto-style3">
                <asp:Label ID="lblPurchaseTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;Click to submit your order:&nbsp;</td>
            <td class="auto-style3">
                <asp:Button ID="btnCheckOut" runat="server" Text="Cash Out" OnClick="btnCheckOut_Click" />
            </td>
        </tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Invoices] WHERE [InvoiceID] = @original_InvoiceID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([InvoiceTotal] = @original_InvoiceTotal) OR ([InvoiceTotal] IS NULL AND @original_InvoiceTotal IS NULL)) AND (([PaymentTotal] = @original_PaymentTotal) OR ([PaymentTotal] IS NULL AND @original_PaymentTotal IS NULL)) AND (([PaymentDate] = @original_PaymentDate) OR ([PaymentDate] IS NULL AND @original_PaymentDate IS NULL))" InsertCommand="INSERT INTO [Invoices] ([UserID], [Date], [InvoiceTotal], [PaymentTotal], [PaymentDate]) VALUES (@UserID, @Date, @InvoiceTotal, @PaymentTotal, @PaymentDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Invoices]" UpdateCommand="UPDATE [Invoices] SET [UserID] = @UserID, [Date] = @Date, [InvoiceTotal] = @InvoiceTotal, [PaymentTotal] = @PaymentTotal, [PaymentDate] = @PaymentDate WHERE [InvoiceID] = @original_InvoiceID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([InvoiceTotal] = @original_InvoiceTotal) OR ([InvoiceTotal] IS NULL AND @original_InvoiceTotal IS NULL)) AND (([PaymentTotal] = @original_PaymentTotal) OR ([PaymentTotal] IS NULL AND @original_PaymentTotal IS NULL)) AND (([PaymentDate] = @original_PaymentDate) OR ([PaymentDate] IS NULL AND @original_PaymentDate IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_InvoiceID" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_InvoiceTotal" Type="Decimal" />
                <asp:Parameter Name="original_PaymentTotal" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_PaymentDate" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="InvoiceTotal" Type="Decimal" />
                <asp:Parameter Name="PaymentTotal" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="PaymentDate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="InvoiceTotal" Type="Decimal" />
                <asp:Parameter Name="PaymentTotal" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="PaymentDate" />
                <asp:Parameter Name="original_InvoiceID" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_InvoiceTotal" Type="Decimal" />
                <asp:Parameter Name="original_PaymentTotal" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_PaymentDate" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Books_Invoices]"></asp:SqlDataSource>
    </div>
</asp:Content>

