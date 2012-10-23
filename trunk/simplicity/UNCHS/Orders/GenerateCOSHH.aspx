<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="GenerateCOSHH.aspx.cs" Inherits="Orders_GenerateCOSHH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Generate COSHH Documents
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="ddl_field">
        <asp:DropDownList ID="ddlDepartments" runat="server" AutoPostBack="True" 
            DataSourceID="odsDepartments" DataTextField="co_name_short"  CssClass="dropdown_txt"
            DataValueField="dept_id">
        </asp:DropDownList>
        
    </div>
    <div class="field"><asp:HyperLink ID="hlDoc" runat="server" Visible="false">Link to Document</asp:HyperLink>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnGenerate" runat="server" Text="Generate" 
            onclick="btnGenerate_Click" />
    </div>
    <div class="grid">
        <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
            DataSourceID="odsDocuments" PageSize="50" AllowPaging="True" 
            AllowSorting="True" DataKeyNames="doc_id" >

            <PagerStyle CssClass="grid_pager" />
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <center>
                        <asp:CheckBox ID="cbSelect" runat="server" />
                        <asp:HiddenField ID="hfDocId" runat="server" Value='<%#Eval("doc_id")%>'/>
                        <asp:HiddenField ID="hfDocName" runat="server" Value='<%#Eval("doc_name")%>'/>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="category_name" HeaderText="Category" 
                    SortExpression="category_name" />
                <asp:BoundField DataField="doc_name" HeaderText="Document Name" 
                    SortExpression="doc_name" />
                <asp:BoundField DataField="doc_code" HeaderText="Doc Code" 
                    SortExpression="doc_code" />
                <asp:BoundField DataField="related_doc_codes" HeaderText="Related Docs" 
                    SortExpression="related_doc_codes" />
            </Columns>
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />            
        </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsDocuments" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocsByTypeName" 
        TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" 
                Type="Int32" />
            <asp:ControlParameter ControlID="ddlDepartments" DefaultValue="0" 
                Name="dept_id" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter DefaultValue="COSHH Documents" Name="doc_type_desc" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDepartments" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDepartmentsByCoId" 
        TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

