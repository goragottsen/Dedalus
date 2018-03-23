<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style38 {
            width: 224px;
        }
        .auto-style47 {
            height: 64px;
        }
        .auto-style48 {
            height: 64px;
            text-align: right;
        }
        .auto-style49 {
            height: 57px;
        }
        .auto-style51 {
            height: 32px;
            text-align: right;
        }
        .auto-style52 {
            height: 32px;
        }
        .auto-style53 {
            height: 31px;
        }
        .auto-style54 {
            height: 31px;
            text-align: right;
        }
        .auto-style55 {
            height: 57px;
            text-align: right;
        }
        .auto-style56 {
            height: 57px;
            width: 317px;
        }
        .auto-style57 {
            height: 64px;
            width: 317px;
        }
        .auto-style58 {
            height: 32px;
            width: 317px;
        }
        .auto-style59 {
            height: 31px;
            width: 317px;
        }
    </style>
    <script>
        function validatePassword(oSrc, args) { //clientside validation for password, length 6-20, requires 1 uc, 1 lc and 1 num
            var password = args.Value;
            var hasLower = false;
            var hasUpper = false;
            var hasNum = false;
            if (6 > password.length || password.length > 20) { //check length, reject if less than 6 or greater than 20 chars
                args.IsValid = false;
                return;
            }
            for (var i = 0; i < password.length; i++) {
                if (isNumber(password.charCodeAt(i))) { //check if number, fulfill number requirement if true
                    hasNum = true;  
                }
                else if (isUppercase(password.charCodeAt(i))) { //check if uppercase, fulfill upper requirement if true
                    hasUpper = true;                 
                }
                else if (isLowercase(password.charCodeAt(i))) { //check if lowercase, fulfill lower requirement if true
                    hasLower = true;
                }
            }
            if (hasNum == true && hasUpper == true && hasLower == true) { //ensure all requirements are met
                args.IsValid = true;
            }
            else { //reject if requirements are not met
                args.IsValid = false;
            }
        }
        function isNumber(charCode) { //function for checking if a char is a number
            if (48 <= charCode && charCode <= 57) {
                return true;
            }
            else {
                return false;
            }
        }
        function isUppercase(charCode) { //check if char is uppercase letter
            if (65 <= charCode && charCode <= 90) {
                return true;
            }
            else {
                return false;
            }
        }
        function isLowercase(charCode) { //check if char is lowercase letter
            if (97 <= charCode && charCode <= 122) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h1>My Profile</h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style38" rowspan="4">
                    <asp:Image ID="imgAvatar" runat="server" AlternateText="My Avatar" Height="184px" Width="184px" />
                    <br />
                    <asp:Label ID="lblUsername" runat="server"></asp:Label>
                </td>
                <td class="auto-style56">Email Address:</td>
                <td class="auto-style55">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
                <td class="auto-style49"></td>
            </tr>
            <tr>
                <td class="auto-style57">Update Password (must be 6-20 characters in length, must contain one uppercase, one lowercase and one number):</td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style47">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" Display="Dynamic" ErrorMessage="*Required."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtNewPassword" Display="Dynamic" ErrorMessage="Please enter a valid password." OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validatePassword"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style58">Confirm New Password:</td>
                <td class="auto-style51">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style52">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="*Required."></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Passwords must match."></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style59"></td>
                <td class="auto-style54">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                </td>
                <td class="auto-style53"></td>
            </tr>
        </table>
        <br />
    </div>

</asp:Content>

