<%@ Page Title="Dedalus" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Welcome to the Dedalus Web Site!</p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="636px" HorizontalAlign="Left">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:CommandField ButtonType="Button" SelectText="Show Details" ShowSelectButton="True" />
            <asp:ButtonField ButtonType="Button" Text="Add to Cart" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource3" Height="50px" Width="125px" CellPadding="3" HorizontalAlign="Right" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="PublicationYear" HeaderText="PublicationYear" SortExpression="PublicationYear" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
            <asp:BoundField DataField="Format" HeaderText="Format" SortExpression="Format" />
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
    </asp:DetailsView>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND [Publisher] = @original_Publisher AND [PublicationYear] = @original_PublicationYear AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Format] = @original_Format) OR ([Format] IS NULL AND @original_Format IS NULL)) AND (([Genre] = @original_Genre) OR ([Genre] IS NULL AND @original_Genre IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))" InsertCommand="INSERT INTO [Books] ([ISBN], [Title], [Author], [Publisher], [PublicationYear], [Price], [Format], [Genre], [Location]) VALUES (@ISBN, @Title, @Author, @Publisher, @PublicationYear, @Price, @Format, @Genre, @Location)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Books]" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [PublicationYear] = @PublicationYear, [Price] = @Price, [Format] = @Format, [Genre] = @Genre, [Location] = @Location WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND [Publisher] = @original_Publisher AND [PublicationYear] = @original_PublicationYear AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Format] = @original_Format) OR ([Format] IS NULL AND @original_Format IS NULL)) AND (([Genre] = @original_Genre) OR ([Genre] IS NULL AND @original_Genre IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Author" Type="String" />
            <asp:Parameter Name="original_Publisher" Type="String" />
            <asp:Parameter Name="original_PublicationYear" Type="Int32" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_Format" Type="String" />
            <asp:Parameter Name="original_Genre" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="PublicationYear" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Format" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="PublicationYear" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Format" Type="String" />
            <asp:Parameter Name="Genre" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Author" Type="String" />
            <asp:Parameter Name="original_Publisher" Type="String" />
            <asp:Parameter Name="original_PublicationYear" Type="Int32" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter Name="original_Format" Type="String" />
            <asp:Parameter Name="original_Genre" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ISBN], [Title], [Author], [Publisher], [PublicationYear], [Price], [Genre], [Format] FROM [Books] WHERE ([ISBN] = @ISBN)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="ISBN" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    </asp:Content>



