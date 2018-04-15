<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="App_Themes/login.css" type="text/css" rel="stylesheet" />

    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
    .center-block {
    width:40%;
    padding:10px;
    }
    #btnLogin{
        margin-left: 200px;
    }
    </style>
    <%--<h1>Thank you for joining us here at Dedalus books!</h1>
    <p></p>
    <h2>Please provide your login information below.</h2>
    <br />
    <asp:Label ID="lblLoginError" runat="server" Text=""></asp:Label>
    <br />
    <div id="login-content" class="auto-style48">
    <table class="auto-style45">--%>
        <%--<tr>
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
        </div>--%>
        <br />
        <br />
        <br />
       
        <br />
        <div class="container center-block">
             <h4>Thank you for joining us here at Dedalus books!</h4>
            <div class="form-group">
                <div class="col-xs-7 col-sm-7">
                    <asp:TextBox runat="server" placeholder="username" CssClass="form-control username" ID="txtLoginUsername" Width="270px"></asp:TextBox>
                </div>
                <div class="col-xs-7 col-sm-5" style="padding-bottom:10px">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtLoginUsername"
                            ErrorMessage="Username is required."
                            ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </span>
                </div>
                    <div class="col-xs-7 col-sm-7">
                    <asp:TextBox runat="server" TextMode="Password" placeholder="password" CssClass="form-control username" ID="TxtLoginPassword" Width="270px"></asp:TextBox>
                </div>
                <div class="col-xs-7 col-sm-5">
                    <span class="help-inline pull-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="TxtLoginPassword"
                            ErrorMessage="Password is required."
                            ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </span>
                </div>
                <br />
                <p style="padding-left: 30px">Forgot your Username? Click here.</p>
                <p style="padding-left: 30px">Forgot your Password? Click here.</p>
                <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary" />
                <br />
                <br />
                <asp:Label ID="lblLoginError" runat="server" />
             </div>
        </div>
</asp:Content>


