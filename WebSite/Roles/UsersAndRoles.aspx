<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UsersAndRoles.aspx.cs" Inherits="Roles_UsersAndRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p align="center">
        <asp:Label ID="ActionStatus" runat="server" Text="Label" CssClass="Important"></asp:Label>
    </p>
    <h3>Manage Roles By User</h3>

    <p>
        <b>Select a User:</b>

        <asp:DropDownList ID="UserList" runat="server" AutoPostBack="true" DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged"></asp:DropDownList>
    </p>
    <p>
        <asp:Repeater ID="UserRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox ID="RoleCheckBox" AutoPostBack="true" runat="server"
                    Text="<%#Container.DataItem %>" OnCheckedChanged="RoleCheckBox_CheckedChanged" />
                <br />
            </ItemTemplate>
        </asp:Repeater>

    </p>
    <h3>Manage Users By Role</h3>
    <p>
        <b>Select a Role: </b>

        <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RoleList_SelectedIndexChanged" ></asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="false" EmptyDataText="No users belong to this role" OnRowDeleting="RolesUserList_RowDeleted" >
            <Columns>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="true" />
                <asp:TemplateField HeaderText="Users">
                    <ItemTemplate>
                        <asp:Label runat="server" id="UserNameLabel" Text="<%#Container.DataItem %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <b>UserName:</b>
        <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="AddUserToRoleButton" runat="server" Text="Add User To Role" OnClick="AddUserToRoleButton_Click" />

    </p>
</asp:Content>

