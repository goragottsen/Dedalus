<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style39 {
            width: 142px;
        }
        .auto-style40 {
            width: 270px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Thank you for joining us here at Dedalus books!</h1>
    <h2>Please provide your login information below.</h2>
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style40">Username:</td>
            <td class="auto-style39">
                <asp:TextBox ID="txtLoginUsername" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="username" runat="server" ControlToValidate="txtLoginUsername" Display="Dynamic" ErrorMessage="Please eneter your username."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style40">Please provide your username or E-mail address.</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">&nbsp;</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">Password:</td>
            <td class="auto-style39">
                <asp:TextBox ID="TxtLoginPassword" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLoginPassword" ErrorMessage="Please enter your password correctly"></asp:RequiredFieldValidator>
                .</td>
        </tr>
        <tr>
            <td class="auto-style40">Please provide your password.</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">&nbsp;</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">&nbsp;</td>
            <td class="auto-style39">
                <asp:Button ID="btnLogin" runat="server" Text="Login" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">&nbsp;</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <h3>Forgot your Username? Click here.</h3>
    <h3>Forgot your Password? Click here.</h3>

</asp:Content>


