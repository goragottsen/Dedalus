<%@ Page Title="Transaction List" Language="C#" MasterPageFile="~/Moderator/MasterPage.master" AutoEventWireup="true" CodeFile="TransactionsList.aspx.cs" Inherits="Moderator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="display-4">Welcome to the Transaction Page!</h1>
    <asp:gridview runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="InvoiceID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" InsertVisible="False" ReadOnly="True" SortExpression="InvoiceID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="InvoiceTotal" HeaderText="InvoiceTotal" SortExpression="InvoiceTotal" />
            <asp:BoundField DataField="PaymentTotal" HeaderText="PaymentTotal" SortExpression="PaymentTotal" />
            <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:gridview>
    <asp:sqldatasource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Invoices] ORDER BY [InvoiceID]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Invoices] WHERE [InvoiceID] = @original_InvoiceID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([InvoiceTotal] = @original_InvoiceTotal) OR ([InvoiceTotal] IS NULL AND @original_InvoiceTotal IS NULL)) AND (([PaymentTotal] = @original_PaymentTotal) OR ([PaymentTotal] IS NULL AND @original_PaymentTotal IS NULL)) AND (([PaymentDate] = @original_PaymentDate) OR ([PaymentDate] IS NULL AND @original_PaymentDate IS NULL))" InsertCommand="INSERT INTO [Invoices] ([UserID], [Date], [InvoiceTotal], [PaymentTotal], [PaymentDate]) VALUES (@UserID, @Date, @InvoiceTotal, @PaymentTotal, @PaymentDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Invoices] SET [UserID] = @UserID, [Date] = @Date, [InvoiceTotal] = @InvoiceTotal, [PaymentTotal] = @PaymentTotal, [PaymentDate] = @PaymentDate WHERE [InvoiceID] = @original_InvoiceID AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([InvoiceTotal] = @original_InvoiceTotal) OR ([InvoiceTotal] IS NULL AND @original_InvoiceTotal IS NULL)) AND (([PaymentTotal] = @original_PaymentTotal) OR ([PaymentTotal] IS NULL AND @original_PaymentTotal IS NULL)) AND (([PaymentDate] = @original_PaymentDate) OR ([PaymentDate] IS NULL AND @original_PaymentDate IS NULL))">
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
    </asp:sqldatasource>
</asp:Content>

