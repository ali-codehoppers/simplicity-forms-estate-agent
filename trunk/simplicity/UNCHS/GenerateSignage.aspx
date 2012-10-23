<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="GenerateSignage.aspx.cs" Inherits="GenerateSignage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    <div class="topLeft">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
    </div>
    <div class="topMid">
        <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
            height="20" />
    </div>
    <div class="topRight">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
    </div>
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Signage Document
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 290px;">
        <div class="ddl_field">
            <asp:DropDownList ID="ddlDepartments" runat="server" AutoPostBack="True" CssClass="dropdown_txt"
                DataSourceID="odsDepartments" DataTextField="co_name_short" DataValueField="dept_id">
            </asp:DropDownList>
        </div>
        <div class="field">
            <asp:HyperLink ID="hlDoc" runat="server" Visible="false">Link to Document</asp:HyperLink>
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnGenerate" runat="server" CssClass="txt_white" OnClick="btnGenerate_Click">Generate</asp:LinkButton>
            </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="grid">
            <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="table_header_result"
                DataSourceID="odsDocuments" PageSize="50" AllowPaging="True" Style="width: 100%;"
                AllowSorting="True" DataKeyNames="doc_id">
                <PagerStyle CssClass="grid_pager" />
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <center>
                                <asp:CheckBox ID="cbSelect" runat="server" />
                                <asp:HiddenField ID="hfDocId" runat="server" Value='<%#Eval("doc_id")%>' />
                                <asp:HiddenField ID="hfDocName" runat="server" Value='<%#Eval("doc_name")%>' />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="category_name" HeaderText="Category" SortExpression="category_name" />
                    <asp:BoundField DataField="doc_name" HeaderText="Document Name" SortExpression="doc_name" />
                    <asp:BoundField DataField="doc_code" HeaderText="Doc Code" SortExpression="doc_code" />
                    <asp:BoundField DataField="related_doc_codes" HeaderText="Related Docs" SortExpression="related_doc_codes" />
                </Columns>
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="odsDocuments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocsByTypeName" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:ControlParameter ControlID="ddlDepartments" DefaultValue="0" Name="dept_id"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="Signage" Name="doc_type_desc" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div style="float: left; width: 100%">
        <div class="floatLeft">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" />
        </div>
        <div class="bottonMid">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
