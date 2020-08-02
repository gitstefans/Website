<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RoleBasedAuthorization.aspx.cs" Inherits="Roles_RoleBasedAuthorization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:LoginView ID="LoginView1" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    As an administrator, you may edit and delete user accounts.
                    Remember: With great power comes great responsibility!
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="User">
                <ContentTemplate>
                    As a user, you may edit users&#39; Email and Comment information.
                    Simply click the Edit Button, make your changes, and then click Update.
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
        <LoggedInTemplate>
            You are not member of the Admin role. Therefore you cannot edit or delete any user information.
        </LoggedInTemplate>
        <AnonymousTemplate>
            You are not logged in into the system. Therefore you cannot edit or delete any user information.

        </AnonymousTemplate>
    </asp:LoginView>

    <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="UserName"
         OnRowEditing="UserGrid_RowEditing" OnRowCancelingEdit="UserGrid_RowCancelingEdit" OnRowUpdating="UserGrid_RowUpdating" OnRowDeleting="UserGrid_RowDeleting" OnRowCreated="UserGrid_RowCreated">
        <Columns>
            <%--<asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />--%>
            <asp:TemplateField ShowHeader="false">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true"
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false"
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="false"
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="UserName" DataField="UserName" ReadOnly="true" />
            <asp:BoundField HeaderText="Last Login" DataField="LastLoginDate" HtmlEncode="false" DataFormatString="{0:d}" ReadOnly="true" />
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Email" Text='<%# Bind("Email") %>'></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="Email" Display="Dynamic"
                        ErrorMessage="You must provide an email address."
                        SetFocusOnError="true">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ControlToValidate="Email" Display="Dynamic"
                        ErrorMessage="The Email address you have entered is not valid. Please fix this and try again"
                        SetFocusOnError="true"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>

                </EditItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Comment">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("Comment") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Comment" TextMode="MultiLine"
                        Columns="40" Rows="4" Text='<%#Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
</asp:Content>

