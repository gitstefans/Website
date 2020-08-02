<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="Roles_ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <b>Create a New Role: </b>
    <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" OnClick="CreateRoleButton_Click" />
    <br />
    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="false" OnRowDeleting="RoleList_RowDeleting">
        <Columns>
           
            
            <asp:CommandField DeleteText="DeleteRole" ShowDeleteButton="true" />
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    
                    <asp:Label ID="RoleNameLabel" runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


</asp:Content>

