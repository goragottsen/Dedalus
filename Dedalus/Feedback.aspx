﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/Feedback/feedback.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        /*function validateEmail(source, args) {
            var regex = new RegExp("^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");
            var notValid = !regex.test(args.Value);
            var txtEmail = document.getElementById("txtEmail");
            alert(notValid);
            alert(txtEmail);
            if (notValid) {
                txtEmail.classList.add("error");
            }
            else {
                try {
                    txtEmail.classList.remove("error");
                }
                catch (e) {}
            }
        }*/
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="feedback-container">
        <h2 id ="feedback-title">Tell us what you think!</h2>
        <label for="txtName" class="feedbackLabel">Your name:</label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Your name is required!" ControlToValidate="txtName">*Required</asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="txtName" runat="server" CssClass="feedbackInfo" placeholder="Enter your name here!"></asp:TextBox>
        <br />
        <br /><br />
        <label for="txtEmail" class="feedbackLabel">Your e-mail address</label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Your email address is required!" ControlToValidate="txtEmail">*Required</asp:RequiredFieldValidator><br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="feedbackInfo" placeholder="Enter your email here!"></asp:TextBox>
        <br />
        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
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
            <asp:ListItem value="other" Text="<input id='ContentPlaceHolder1_cbDeviceUsage_Other' type='text' name='ct100$ContentPlaceHolder1_cbDeviceUsage_Other' class='cbOtherDevice' placeholder='Other Device' maxlength='20'>"/>
        </asp:CheckBoxList>
        <br />
        <label for="comment" class="feedbackLabel">Any Additional Comments?</label>
        <br />
        <asp:TextBox ID="txtComments" runat="server" CssClass="feedbackInfo comment" Height="125px" MaxLength="300" Width="250px" placeholder="(300 character limit)"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Send!" CssClass="btnSubmit" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>

