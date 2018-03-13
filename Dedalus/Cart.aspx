<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h1>Cart Page:</h1>
    </div>
    <div>
        <p>Your Cart Currently Holds:</p>
        <p>Not happy with your order? Or just want to start over? <asp:Button ID="btnClearCart" runat="server" Text="Delete Order" />   
        </p><!-- Adding this button just in case the user wants to "wipe their slate clean" and start over -->
        <span><asp:TextBox ID="tbCart" runat="server" Height="100px" Width="500px" TextMode="MultiLine">Your cart is currently empty.</asp:TextBox></span>
        <!-- Currently going with the type of shopping cart that Professor Andrew Rudder showed us in the lab. It can be subject to change at a later date -->
        <!-- I feel as though we'll only really be able to code the shopping cart functionality once the database had been implemented -->
    </div>
    <div>
        <p>Ready to proceed to checkout? <asp:Button ID="btnCartToCheckout" runat="server" Text="Proceed to Checkout" />
        </p>
    </div>
</asp:Content>

