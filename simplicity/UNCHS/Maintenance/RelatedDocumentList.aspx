<%@ Page Language="C#" MasterPageFile="~/Common/Plain.master" AutoEventWireup="true"
    CodeFile="RelatedDocumentList.aspx.cs" Inherits="Maintenance_RelatedDocumentList"
    Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="grid" style="height: 400px; overflow: auto; width: 98%; border: solid 1px black">
        <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="doc_id" DataSourceID="odsDocs" PageSize="50" AllowPaging="True"
            AllowSorting="True" OnDataBound="gvDocs_DataBound">
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <HeaderStyle Width="50px" />
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelect" runat="server" />
                        <asp:HiddenField ID="hfDocId" runat="server" Value='<%# Bind("doc_id") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="category_name">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code" SortExpression="doc_code">
                    <ItemTemplate>
                        <asp:Label ID="lblDocCode" runat="server" Text='<%# Bind("doc_code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Document Name" SortExpression="doc_name">
                    <ItemTemplate>
                        <asp:Label ID="lblDocName" runat="server" Text='<%# Bind("doc_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsDocs" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocsByTypeId" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="doc_type_id" QueryStringField="docTypeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="button_bar">
        <div style="float: left">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
        </div>
        <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
            <asp:LinkButton ID="btnSave" runat="server" Text="Save Related Documents" OnClick="btnSave_Click"
                CssClass="txt_white"></asp:LinkButton>
        </div>
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
    </div>
</asp:Content>
