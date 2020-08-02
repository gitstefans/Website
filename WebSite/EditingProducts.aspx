<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditingProducts.aspx.cs" Inherits="EditingProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 runat="server" id="PageHeading"></h1>

    <asp:Label ID="Label1" runat="server" Text="Picture"></asp:Label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="NameLabel" runat="server" Text="Product name"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="NameLabelError" runat="server" Text=""></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter product name!" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
    <br />

    <asp:Label ID="PriceLabel" runat="server" Text="Price"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must enter product price!" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
  
    
    <asp:HiddenField ID="IdHiddenField" runat="server" />
    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />

</asp:Content>

