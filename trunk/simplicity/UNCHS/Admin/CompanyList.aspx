<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="CompanyList.aspx.cs" Inherits="Admin_CompanyList" Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Companies List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="field">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/AddCompany.aspx">Add Company</asp:HyperLink>
</div>
<div class="grid">
    <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="co_id" DataSourceID="odsCompany" PageSize="50" AllowPaging="True" AllowSorting="True" Width="100%" OnRowCommand="gvCompanies_RowCommand" >
        
        <PagerStyle CssClass="grid_pager" />
        <FooterStyle CssClass="grid_footer" />
        <SelectedRowStyle CssClass="grid_selected_row" />
        <HeaderStyle CssClass="grid_header" />
        <AlternatingRowStyle CssClass="grid_alternating_row" />
        <RowStyle CssClass="grid_row" />
        <Columns>
            <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="dept_id">
                <ItemTemplate>
                    <center>

                    <a href='AddCompany.aspx?coId=<%# Eval("co_id") %>' style="border:none; text-decoration:none;">
                    <img src="../Images/edit.png" alt="Edit" class="noborder" /></a>

                    </center>  
                                          
                </ItemTemplate>
                <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="dept_id">
                    <ItemTemplate>
                    <center>
                        
                            <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png" CommandName="Delete"
                                 OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        
                        </center>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>                

            <asp:BoundField DataField="co_name_short" HeaderText="Short Name" SortExpression="co_name_short" >
                <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="co_name_long" HeaderText="Long Name" SortExpression="co_name_long" >
                <HeaderStyle Width="150px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Contact" SortExpression="contact_surname">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# GetDetailContact(Eval("contact_title"),Eval("contact_forename"),Eval("contact_surname")) %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="250px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="address_full">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("address_full") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("address_full") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activate?" SortExpression="address_full">
                <ItemTemplate>
                <center>
                    <asp:Button ID="btnActivate" runat="server" Text="Activate" CommandName="Activate" CommandArgument='<%#Eval("co_id")%>' Visible='<%#!Convert.ToBoolean(Eval("flg_active"))%>' OnClientClick="return confirm('Are you sure you want to activate this company?');"/>
                    <asp:Button ID="btnDeactivate" runat="server" Text="Deactivate" CommandName="Deactivate" CommandArgument='<%#Eval("co_id")%>' Visible='<%#Convert.ToBoolean(Eval("flg_active"))%>' OnClientClick="return confirm('Are you sure you want to Inactivate this company? The users belonging to this company will not be able to login.');"/>
                </center>
                </ItemTemplate>
                
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsCompany" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllCompanies" TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_co_id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</div>
</asp:Content>

