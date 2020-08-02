<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <asp:Button ID="ButtonNew" runat="server" Text="New" PostBackUrl="Products.aspx?mode=new" />
    </asp:Panel>
    <br />
    <asp:Panel ID="ProductContainer"  runat="server">
    </asp:Panel>
  
</asp:Content>

