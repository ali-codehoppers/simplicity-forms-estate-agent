<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="UsersList.aspx.cs" Inherits="Admin_UsersList" Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="ddl_field"><span>Company:</span><asp:DropDownList ID="ddlCompany" 
        runat="server" DataSourceID="odsCompany" DataTextField="co_name_short" 
        DataValueField="co_id" ondatabound="ddlCompany_DataBound" AutoPostBack="true">
        </asp:DropDownList></div>
<div class="ddl_field">
    <span>Role:</span><asp:DropDownList ID="ddlRole" runat="server" 
        AutoPostBack="True">
        <asp:ListItem Text="All" Value="all"></asp:ListItem>
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="User" Value="User"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="grid">
    <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="user_id" DataSourceID="odsUsers" PageSize="50" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Edit" >
                <HeaderStyle Width="50px" />
                <ItemTemplate>
                    <a href='AddUser.aspx?userId=<%# Eval("user_id") %>' style="border:none; text-decoration:none;">
                                <img src="../Images/edit.png" alt="Edit" class="noborder" /></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="Delete" >
                <HeaderStyle Width="50px" />
                <ItemTemplate>                                        
                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                </ItemTemplate>         
                <ItemStyle HorizontalAlign="Center" />     
            </asp:TemplateField>
        
            <asp:BoundField DataField="co_name_short" HeaderText="Company" SortExpression="co_name_short" />
            <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name" />
            <asp:BoundField DataField="user_logon" HeaderText="User Login" SortExpression="user_logon" />
            <asp:BoundField DataField="user_enable_reminder" HeaderText="User Enable Reminder"
                SortExpression="user_enable_reminder" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
        </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        
    </asp:GridView>
    <asp:ObjectDataSource ID="odsUsers" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUserByCoAndRole" 
        TypeName="UserTableAdapters.un_co_user_detailsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_user_id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlRole" DefaultValue="0" Name="role" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCompany" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCompanies" 
        TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
    </asp:ObjectDataSource>    
</div>
</asp:Content>

