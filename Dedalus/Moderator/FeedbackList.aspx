<%@ Page Title="FeedbackList" Language="C#" MasterPageFile="~/Moderator/MasterPage.master" AutoEventWireup="true" CodeFile="FeedbackList.aspx.cs" Inherits="Moderator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="display-4">List of Reviews from Users</h1>
  <asp:SqlDataSource ID="SQLFeedbackData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FeedbackID], [UserID], [Rating], [ISBN], [Device], [Date] FROM [Feedback] ORDER BY [Date] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLFeedbackDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Feedback] WHERE [FeedbackID] = @original_FeedbackID AND (([ISBN] = @original_ISBN) OR ([ISBN] IS NULL AND @original_ISBN IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Rating] = @original_Rating) OR ([Rating] IS NULL AND @original_Rating IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Device] = @original_Device) OR ([Device] IS NULL AND @original_Device IS NULL))" InsertCommand="INSERT INTO [Feedback] ([ISBN], [UserID], [Date], [Rating], [Comment], [Device]) VALUES (@ISBN, @UserID, @Date, @Rating, @Comment, @Device)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Feedback] WHERE ([FeedbackID] = @FeedbackID)" UpdateCommand="UPDATE [Feedback] SET [ISBN] = @ISBN, [UserID] = @UserID, [Date] = @Date, [Rating] = @Rating, [Comment] = @Comment, [Device] = @Device WHERE [FeedbackID] = @original_FeedbackID AND (([ISBN] = @original_ISBN) OR ([ISBN] IS NULL AND @original_ISBN IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Rating] = @original_Rating) OR ([Rating] IS NULL AND @original_Rating IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND (([Device] = @original_Device) OR ([Device] IS NULL AND @original_Device IS NULL))" ConflictDetection="CompareAllValues">
        <DeleteParameters>
            <asp:Parameter Name="original_FeedbackID" Type="Int32" />
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_Date" />
            <asp:Parameter Name="original_Rating" Type="Int32" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Device" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Device" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="FeedbackData" Name="FeedbackID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Device" Type="String" />
            <asp:Parameter Name="original_FeedbackID" Type="Int32" />
            <asp:Parameter Name="original_ISBN" Type="String" />
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_Date" />
            <asp:Parameter Name="original_Rating" Type="Int32" />
            <asp:Parameter Name="original_Comment" Type="String" />
            <asp:Parameter Name="original_Device" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
            <td style="width:35%;">
                <asp:DetailsView ID="FeedbackDetails" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="FeedbackID" DataSourceID="SQLFeedbackDetails" ForeColor="#333333" GridLines="None" OnItemDeleted="FeedbackDetails_ItemDeleted">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="FeedbackID" HeaderText="FeedbackID" InsertVisible="False" ReadOnly="True" SortExpression="FeedbackID" />
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                        <asp:BoundField DataField="Device" HeaderText="Device" SortExpression="Device" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:Label ID="lblMsgs" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:GridView ID="FeedbackData" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SQLFeedbackData" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="FeedbackID">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        <asp:BoundField DataField="FeedbackID" HeaderText="FeedbackID" SortExpression="FeedbackID" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                        <asp:BoundField DataField="Device" HeaderText="Device" SortExpression="Device" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
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
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

