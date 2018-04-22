<%@ Page Title="" Language="C#" MasterPageFile="~/Moderator/MasterPage.master" AutoEventWireup="true" CodeFile="PurchaseSuccessModerator.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/Login-success.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" align="center">
        <h1 class="display-4">Thank you for purchasing at Dedalus books!</h1>
        <h1><small>You will be redirected to your home page shortly. If no, please click <a href="Home.aspx">here</a>. </small></h1>
        <div class="loader"></div>
    </div>
</asp:Content>

