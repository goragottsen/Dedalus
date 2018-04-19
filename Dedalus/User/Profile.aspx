<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style57 {
            height: 64px;
            width: 399px;
            text-align: left;
        }
        .auto-style60 {
            width: 192px;
            height: 26px;
            text-align: center;
        }
        .auto-style61 {
            height: 31px;
            width: 321px;
            text-align: left;
        }
        .auto-style64 {
            height: 68px;
            width: 321px;
            text-align: right;
        }
        .auto-style66 {
            height: 68px;
            width: 321px;
            text-align: center;
        }
        .auto-style67 {
            height: 31px;
            width: 399px;
            text-align: left;
        }
        .auto-style68 {
            height: 36px;
            width: 399px;
            text-align: left;
        }
        .auto-style69 {
            height: 36px;
            width: 321px;
            text-align: center;
        }
        .auto-style70 {
            height: 36px;
            width: 321px;
            text-align: right;
        }
        .auto-style71 {
            height: 68px;
            width: 399px;
            text-align: left;
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
        <h1 class="display-4">Hi <asp:Label ID="username" runat="server" Text=""></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND [Name] = @original_Name AND [Username] = @original_Username AND [Password] = @original_Password AND [Email] = @original_Email AND [Address] = @original_Address AND [AccessLevel] = @original_AccessLevel" InsertCommand="INSERT INTO [Users] ([Name], [Username], [Password], [Email], [Address], [AccessLevel]) VALUES (@Name, @Username, @Password, @Email, @Address, @AccessLevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users] WHERE (([Username] = @Username) AND ([Password] = @Password))" UpdateCommand="UPDATE [Users] SET [Password] = @Password WHERE [Username] = @original_Username">
                <DeleteParameters>
                    <asp:Parameter Name="original_UserID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_AccessLevel" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="AccessLevel" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
                    <asp:SessionParameter Name="Password" SessionField="Userpassword" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:ControlParameter ControlID="txtNewPassword" Name="Password" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="AccessLevel" Type="Int32" />
                    <asp:Parameter Name="original_UserID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:SessionParameter Name="original_Username" SessionField="Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_AccessLevel" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style60" rowspan="6">
                    <asp:Image ID="imgAvatar" runat="server" AlternateText="My Avatar" Height="184px" Width="184px" ImageUrl="~/App_Images/avatarph.png" />
                    <br />
                    User<br />
                </td>
                <td class="text-left" colspan="3">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="1042px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td class="auto-style57"><strong>Update Password</strong></tr>
            <tr>
                <td class="auto-style68">Current Password:</td>
                <td class="auto-style69">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style70">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Incorrect password." OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style71">New Password (must be 6-20 characters in length, must contain one uppercase, one lowercase and one number):</td>
                <td class="auto-style66">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style64">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtNewPassword" Display="Dynamic" ErrorMessage="Please enter a valid password." OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validatePassword"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style68">Confirm New Password:</td>
                <td class="auto-style69">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style70">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="* Required."></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Passwords must match."></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style67">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                </td>
                <td class="auto-style61">
                    &nbsp;</td>
                <td class="auto-style61">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </div>

</asp:Content>

