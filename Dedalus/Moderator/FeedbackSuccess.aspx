<%@ Page Title="" Language="C#" MasterPageFile="~/Moderator/MasterPage.master" AutoEventWireup="true" CodeFile="FeedbackSuccess.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/Feedback/feedback.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="feedback-container">
        <h1 id="feedback-title">Your feedback has been sent!</h1>
        <p class="content">We're excited to see what you have to say!
            <br />
        Depending on your feedback, we may respond to your comments or concerns as soon as possible!
        </p>
        <br />
        <asp:Button ID="btnReturn" runat="server" CssClass="btnSubmit" Text="Return Home!" OnClick="btnReturn_Click" />

    </div>
</asp:Content>

