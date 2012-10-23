<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="SectionList.aspx.cs" Inherits="Maintenance_SectionList" Title="Simplicity4Business" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <style type="text/css">
        .text_field span
        {
            font-weight: bold;
        }
        .field span
        {
            font-weight: bold;
        }
        .ddl_field span
        {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 415px;">
        <div class="ddl_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px;">
                <span>Department:</span>
            </div>
            <asp:DropDownList ID="ddlDepartment" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
                CssClass="dropdown_txt" AutoPostBack="True">
            </asp:DropDownList>
        </div>
        <div class="ddl_field">
            <div style="float: left; width: 200px;">
                <span>Document Type:</span>
            </div>
            <asp:DropDownList ID="ddlDocType" runat="server" DataSourceID="odsDocTypes" DataTextField="doc_data_type_desc"
                DataValueField="doc_data_type_id" OnSelectedIndexChanged="ddlDocType_SelectedIndexChanged"
                AutoPostBack="True" OnDataBound="ddlDocType_DataBound" CssClass="dropdown_txt">
            </asp:DropDownList>
        </div>
        <div class="field" style="padding-top: 5px; padding-bottom: 5px">
            <asp:Label ID="lblWarning" runat="server" Text="Label" CssClass="error_msg" Visible="False"
                Width="800px"></asp:Label>
        </div>
        <div class="text_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px;">
                <span>Section:</span>
            </div>
            <asp:TextBox ID="tbSec" runat="server" Rows="3" TextMode="MultiLine" Style="width: 300px;"
                CssClass="text_area"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                ControlToValidate="tbSec"></asp:RequiredFieldValidator>
        </div>
        <div class="text_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px;">
                <span>Index:</span>
            </div>
            <ew:NumericBox ID="tbIndex" runat="server" CssClass="field_txt"></ew:NumericBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ControlToValidate="tbIndex"></asp:RequiredFieldValidator>
        </div>
        <div class="ddl_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px;">
                <span>Section Type:</span>
            </div>
            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="TRUE" CssClass="dropdown_txt">
                <asp:ListItem Value="FREE_TEXT" Text="Free Text"></asp:ListItem>
                <asp:ListItem Value="MULTIPLE_SELECT_LIST" Text="Multiple Select List"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="text_field">
            <div style="float: left; width: 200px; padding-bottom: 5px;">
                <span>Number of Columns:</span>
            </div>
            <ew:NumericBox ID="tbNumOfCols" runat="server" CssClass="field_txt"></ew:NumericBox>
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="txt_white">Add Section</asp:LinkButton>
            </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="grid">
            <asp:GridView ID="gvSections" runat="server" AutoGenerateColumns="False" CssClass="table_header_result"
                Style="width=100%" DataKeyNames="section_id" DataSourceID="odsSections" PageSize="50"
                AllowPaging="True" AllowSorting="True" OnRowUpdating="gvSections_RowUpdating"
                OnPreRender="gvSections_PreRender">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <HeaderStyle Width="50px" />
                        <ItemTemplate>
                            <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Edit"
                                ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Update"
                                ImageUrl="~/Images/icon_edit.png" AlternateText="Update" ValidationGroup="Grid">
                            </asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <HeaderStyle Width="50px" />
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                ImageUrl="~/Images/icon_cancel.png" AlternateText="Cancel"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                            </asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section" SortExpression="section_desc">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Text='<%# Bind("section_desc") %>'
                                Width="200px" Rows="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("section_desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Index" SortExpression="section_index">
                        <EditItemTemplate>
                            <ew:NumericBox ID="tbEstWork" runat="server" Text='<%# Bind("section_index") %>'></ew:NumericBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ControlToValidate="tbEstWork"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("section_index") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section Type" SortExpression="section_type">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGridType" Style="width: 110px" CssClass="dropdown_txt" runat="server"
                                SelectedValue='<%# Bind("section_type") %>'>
                                <asp:ListItem Value="FREE_TEXT">Free Text</asp:ListItem>
                                <asp:ListItem Value="MULTIPLE_SELECT_LIST">Multiple Select List</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# GetSectionText(Eval("section_type")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Columns" SortExpression="repeat_columns">
                        <EditItemTemplate>
                            <ew:NumericBox ID="tbNumOfCols" runat="server" Text='<%# Bind("repeat_columns") %>'></ew:NumericBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("repeat_columns") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/Maintenance/SectionDetailList.aspx?" + WebConstants.Request.DEPT_ID + "=" + Eval("dept_id") + "&" + WebConstants.Request.SEC_ID + "=" + Eval("section_id") %>'
                                Visible='<%#DoShowDetail(Eval("section_type"))%>'>Details</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSections" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByDocType" TypeName="DocumentTemplateTableAdapters.DocumentSectionTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_section_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="section_index" Type="Int32" />
                <asp:Parameter Name="section_desc" Type="String" />
                <asp:Parameter Name="section_type" Type="String" />
                <asp:Parameter Name="repeat_columns" Type="Int32" />
                <asp:Parameter Name="Original_section_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlDocType" DefaultValue="0" Name="doc_type_id"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="flg_delete" Type="Boolean" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="section_index" Type="Int32" />
                <asp:Parameter Name="section_desc" Type="String" />
                <asp:Parameter Name="section_type" Type="String" />
                <asp:Parameter Name="doc_type_id" Type="Int32" />
                <asp:Parameter Name="repeat_columns" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocTypeByDeptId" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div style="float: left; width: 100%">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div class="bottonMid">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
