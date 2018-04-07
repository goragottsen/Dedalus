<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="ProductReview.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/Feedback/feedback.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="feedback-container">
        <h2 id="feedback-title">Product Review</h2>
        <table id="review-container">
            <tr>
                <th>
                    <label>User:</label>
                </th>
                <td>
                    <label>"Users.NAME (Users.ID)"</label>
                </td>
            </tr>
            <tr>
                <th>
                    <label>Product Title:</label>
                </th>
                <td>
                    <label>"Books.NAME"</label>
                </td>
            </tr>
            <tr>
                <th>
                    <label>Product Author:</label>
                </th>
                <td>
                    <label>"Books.AUTHORID"</label>
                </td>
            </tr>
            <tr>
                <th>
                    <label>Product ISBN:</label>
                </th>
                <td>
                    <label>"Books.ISBNID"</label>
                </td>
            </tr>
            
            <tr>
                <th>
                    <label>Ownership status:</label>
                </th>
                <td>
                    <label>"Owned/Unowned"</label>
                </td>
            </tr>
            <tr>
                <th>
                    <label>Book Completion Status</label>
                    <br />
                    <asp:RequiredFieldValidator 
                        ID="CompletionValidator" runat="server" 
                        ErrorMessage="Please Select a state!" 
                        ControlToValidate="CompletionStatus">
                        *Required
                    </asp:RequiredFieldValidator>
                </th>
                <td>
                    <label>
                        <asp:RadioButtonList ID="CompletionStatus" runat="server" RepeatDirection="Vertical" align="center">
                            <asp:ListItem value="0" Text="Incomplete"/>
                            <asp:ListItem value="1" Text="Finished"/>
                        </asp:RadioButtonList></label>
                </td>
            </tr>
            <tr>
                <th>
                    Rating:
                </th>
                <td>
                    <asp:DropDownList ID="ddlReviewRating" runat="server">
                        <asp:ListItem Value="-1" Text="Please Select a rating." />
                        <asp:ListItem value="0" Text="0"/>
                        <asp:ListItem value="1" Text="1"/>
                        <asp:ListItem value="2" Text="2"/>
                        <asp:ListItem value="3" Text="3"/>
                        <asp:ListItem value="4" Text="4"/>
                        <asp:ListItem value="5" Text="5"/>
                        <asp:ListItem value="-2" Text="Not Applicable" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <th colspan="2">What did you think about the book?</th>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="tbReviewComment" runat="server" placeholder="Your comments (300 character)" MaxLength="300" Width="500" Height="100" ></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:button ID="btnReturn" runat="server" text="Cancel" OnClick="btnReturn_Click" />
                </td>
                <td>
                    <asp:button ID="btnSubmitReview" runat="server" text="Submit" OnClick="btnSubmitReview_Click" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>