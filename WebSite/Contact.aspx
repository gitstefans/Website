<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align:center">Contact Page</h2>
    <br />
   <div style="text-align:center">
    <h3 style="text-decoration:underline;" >Kontakt </h3><br />

    <asp:Label ID="Label1" runat="server" Text="Ime i prezime:"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox> 
    <br />
    <asp:Label ID="Label2" runat="server" Text="Kontakt telefon:"></asp:Label><br />
    <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="E-mail:"></asp:Label><br />
    <asp:TextBox ID="TextBox3" runat="server" Width="250px"></asp:TextBox><br />
    <asp:Label ID="Label4" runat="server" Text="Vasa poruka:"></asp:Label><br />
    <asp:TextBox ID="TextBox4" runat="server" Width="350px" Height="200px" TextMode="MultiLine" Wrap="true"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Posalji" />
        </div>

    <br />
    <br />
</asp:Content>

