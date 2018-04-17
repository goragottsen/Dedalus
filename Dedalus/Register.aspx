<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style39 {
            text-align: center;
            width: 231px;
        }
        .auto-style40 {
            text-align: right;
        }
        .auto-style41 {
            width: 231px;
        }
        .auto-style42 {
            width: 357px;
            text-align: left;
        }
        .auto-style43 {
            width: 357px;
        }
    </style>

    <script>
        function validateUsername(oSrc, args) { //clientside validation for username, cannot contain spaces or special chars
            var username = args.Value;
            args.IsValid = false; //reject if char does not meet criteria

            for (var i = 0; i < username.length; i++) {
                if (isNumber(username.charCodeAt(i))) { //check for number
                    continue;
                }
                else if (isUppercase(username.charCodeAt(i))) { //check for uppercase
                    continue;
                }
                else if (isLowercase(username.charCodeAt(i))) { //check for lowercase
                    continue;
                }
                else {
                    
                    return;
                }
            }
            args.IsValid = true; //accept if no problems found
        }

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
    <h1>Registration</h1>
    <p>Already have an account?
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Sign in here.</asp:HyperLink>
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style43">
                Name:<br />
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td class="text-right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style43">
                Address:<br />
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </td>
            <td class="text-right">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style42">Email Address:<br />
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email already registered." OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style42">Username (cannot contain spaces or special characters):</td>
            <td class="auto-style39">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Please enter a valid username." ClientValidationFunction="validateUsername" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style42">Password (must be 6-20 characters in length, must contain one uppercase, one lowercase and one number):</td>
            <td class="auto-style39">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please enter a valid password." ClientValidationFunction="validatePassword" OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style42">Confirm Password:<br />
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" Display="Dynamic" ErrorMessage="Passwords must match."></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style43">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND [Name] = @original_Name AND [Username] = @original_Username AND [Password] = @original_Password AND [Email] = @original_Email AND [Address] = @original_Address AND [AccessLevel] = @original_AccessLevel" InsertCommand="INSERT INTO [Users] ([Name], [Username], [Password], [Email], [Address], [AccessLevel]) VALUES (@Name, @Username, @Password, @Email, @Address, @AccessLevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [Users] SET [Name] = @Name, [Username] = @Username, [Password] = @Password, [Email] = @Email, [Address] = @Address, [AccessLevel] = @AccessLevel WHERE [UserID] = @original_UserID AND [Name] = @original_Name AND [Username] = @original_Username AND [Password] = @original_Password AND [Email] = @original_Email AND [Address] = @original_Address AND [AccessLevel] = @original_AccessLevel">
                    <DeleteParameters>
                        <asp:Parameter Name="original_UserID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_AccessLevel" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtUsername" Name="Username" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtAddress" DefaultValue="" Name="Address" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="AccessLevel" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="AccessLevel" Type="String" />
                        <asp:Parameter Name="original_UserID" Type="Int32" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_AccessLevel" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style41">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

