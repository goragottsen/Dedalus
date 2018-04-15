<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="App_Themes/login.css" type="text/css" rel="stylesheet" />

    
    <style type="text/css">
        .auto-style44 {
            width: 154px;
            height: 26px;
        }
        .auto-style45 {
            width: 81%;
            height: 167px;
            margin-right: 185px;
        }
        .auto-style48 {
            width: 64%;
        }
        .auto-style49 {
            width: 362px;
            height: 26px;
        }
        .auto-style50 {
            margin-left: 3px;
        }
        .auto-style51 {
            width: 746px;
        }
        .auto-style52 {
            width: 746px;
            height: 26px;
        }
        .auto-style53 {
            width: 308px;
        }
        .auto-style54 {
            width: 303px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Thank you for joining us here at Dedalus books!</h1>
    <p></p>
    <h2>Please provide your login information below.</h2>
    <br />
    <asp:Label ID="lblLoginError" runat="server" Text=""></asp:Label>
    <br />
    <div id="login-content" class="auto-style48">
    <table class="auto-style45">
        <tr>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style44">
                &nbsp;</td>
            <td class="auto-style51">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">Username:</td>
            <td class="auto-style44">
                <asp:TextBox ID="txtLoginUsername" runat="server" Width="145px"></asp:TextBox>
            </td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="username" runat="server" ControlToValidate="txtLoginUsername" Display="Dynamic" ErrorMessage="Please enter your username correctly."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td class="auto-style51">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">Password:</td>
            <td class="auto-style44">
                <asp:TextBox ID="TxtLoginPassword" TextMode="Password" runat="server" Width="143px"></asp:TextBox>
            </td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLoginPassword" ErrorMessage="Please enter your password correctly"></asp:RequiredFieldValidator>
                .</td>
        </tr>
        <tr>
            <td class="auto-style49"></td>
            <td class="auto-style44"></td>
            <td class="auto-style52"></td>
        </tr>
        <tr>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style44">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="125px" CssClass="auto-style50" />
            </td>
            <td class="auto-style51">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style44">&nbsp;</td>
            <td class="auto-style51">&nbsp;</td>
        </tr>
    </table>
        <h3 class="auto-style53">Forgot your Username? Click here.</h3>
        <h3 class="auto-style54">Forgot your Password? Click here.</h3>
        </div>
    

</asp:Content>


