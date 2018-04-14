<%@ Page Title="Home" Language="C#" MasterPageFile="~/Moderator/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="686px" HorizontalAlign="Left" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleted="GridView1_RowDeleted">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Select" />
                    &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ValidateRequestMode="Inherit" />
                    &nbsp; <asp:Button ID="btnAddtoCart" runat="server" CausesValidation="false" CommandName="AddToCart" Text="Add to Cart" OnClick="AddToCartClick"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Silver" Font-Bold="True" Font-Underline="False" ForeColor="Black" />
        <PagerStyle BackColor="Silver" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource3" Height="50px" Width="336px" CellPadding="3" HorizontalAlign="Right" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="PublicationYear" HeaderText="PublicationYear" SortExpression="PublicationYear" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Format" HeaderText="Format" SortExpression="Format" />
            <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowInsertButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))" InsertCommand="INSERT INTO [Books] ([ISBN], [Title], [Author], [Price]) VALUES (@ISBN, @Title, @Author, @Price)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ISBN], [Title], [Author], [Price] FROM [Books]" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [Author] = @Author, [Price] = @Price WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Author" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Author" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
        </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Books] WHERE ([ISBN] = @ISBN)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND [Publisher] = @original_Publisher AND [PublicationYear] = @original_PublicationYear AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Format] = @original_Format) OR ([Format] IS NULL AND @original_Format IS NULL)) AND (([Genre] = @original_Genre) OR ([Genre] IS NULL AND @original_Genre IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))" InsertCommand="INSERT INTO [Books] ([ISBN], [Title], [Author], [Publisher], [PublicationYear], [Price], [Format], [Genre], [Location]) VALUES (@ISBN, @Title, @Author, @Publisher, @PublicationYear, @Price, @Format, @Genre, @Location)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [PublicationYear] = @PublicationYear, [Price] = @Price, [Format] = @Format, [Genre] = @Genre, [Location] = @Location WHERE [ISBN] = @original_ISBN AND [Title] = @original_Title AND [Author] = @original_Author AND [Publisher] = @original_Publisher AND [PublicationYear] = @original_PublicationYear AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Format] = @original_Format) OR ([Format] IS NULL AND @original_Format IS NULL)) AND (([Genre] = @original_Genre) OR ([Genre] IS NULL AND @original_Genre IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL))">
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
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="ISBN" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
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
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
    </asp:Content>



<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
          <div class="container">
              <h1 class="display-3">Welcome to the Dedalus Web Site!</h1>
              <p style="padding: 0px; margin: 0px; display: block; clear: both; position: static;">
                  This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
              <p>
                  <a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a></p>
          </div>
</div>
</asp:Content>




