<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../App_Themes/Feedback/feedback.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="feedback-container" class="jumbotron">
        <h1 id ="feedback-title">Tell us what you think!</h1>
    </div>
    <div class="container">
        <label for="txtName" class="feedbackLabel">Your name:</label>
        <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ErrorMessage="Your name is required!" ControlToValidate="txtName" ForeColor="Red">*Required</asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name here!"></asp:TextBox>
        <br />
        <label for="txtEmail" class="feedbackLabel">Your e-mail address</label>
        <asp:RequiredFieldValidator ID="RequiredEmailValidator" runat="server" ErrorMessage="Your email address is required!" ControlToValidate="txtEmail" ForeColor="Red">*Required</asp:RequiredFieldValidator><br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email here!"></asp:TextBox>
        <asp:CustomValidator ID="RegexEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="true" ForeColor="Red"></asp:CustomValidator>
        <br /><br />
        <label for="rbPgRating" class="feedbackLabel">How would you rate our web site?</label><asp:RadioButtonList ID="rbPgRating" CssClass="selections rbList" runat="server" RepeatDirection="Horizontal" align="center">
            <asp:ListItem value="0" Text="Bad" />
            <asp:ListItem value="1" />
            <asp:ListItem value="2" />
            <asp:ListItem value="3" />
            <asp:ListItem value="4" />
            <asp:ListItem value="5" />
            <asp:ListItem value="6" />
            <asp:ListItem value="7" />
            <asp:ListItem value="8" />
            <asp:ListItem value="9" />
            <asp:ListItem value="10" Text="Good"/>
        </asp:RadioButtonList>
        <br />
        <label for="cbDeviceUsage" class="feedbackLabel">What devices do you use to access our website?</label><asp:CheckBoxList ID="cbDeviceUsage" CssClass="selections cbList" RepeatDirection="Vertical" align="center" runat="server">
            <asp:ListItem value="tablet" Text="Tablet"/>
            <asp:ListItem value="smartPhone" Text="Smart Phone"/>
            <asp:ListItem value="pc" Text="PC"/>
            <asp:ListItem value="other" Text="<input id='ContentPlaceHolder1_cbDeviceUsage_Other' type='text' name='ct100$ContentPlaceHolder1_cbDeviceUsage_Other' class='form-control' placeholder='Other Device' maxlength='20'>"/>
        </asp:CheckBoxList>
        <br />
        <label for="comment" class="feedbackLabel">Any Additional Comments?</label>
        <br />
        <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" Height="125px" MaxLength="300" placeholder="(300 character limit)"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Send!" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" /><br />
    </div>
</asp:Content>

