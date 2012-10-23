<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DocumentList.aspx.cs" Inherits="Maintenance_DocumentList" Title="Simplicity4Business" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
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
    <script type="text/javascript">
        var editDialog;
        var transferDialog;
        function showEditDialog(url) {
            document.getElementById("editFrame").src = url;
            document.getElementById('editDialog').style.display = 'block';
            editDialog.show();
        }
        function canShowTransferDialog(btnObj) {
            if (isSelected(btnObj.form)) {
                showTransferDialog();
            }
            else {
                alert("No documents selected");
            }
        }
        function showTransferDialog() {
            document.getElementById("transferDialog").style.display = 'block';
            transferDialog.show();
        }

        function isSelected(formObj) {
            for (var i = 0; i < formObj.length; i++) {
                if (formObj[i].type == 'checkbox') {
                    if (formObj[i].checked) return true;
                }
            }
            return false;
        }
    </script>
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
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Documents List
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 380px;">
        <div id="editDialog" style="display: none">
            <div class="hd">
                Edit Related Documents:</div>
            <div class="bd">
                <iframe id="editFrame" width="960px" height="480px" scrolling="no"></iframe>
            </div>
            <div class="ft">
            </div>
        </div>
        <div id="transferDialog" style="display: none">
            <div class="hd">
                Transfer Documents:</div>
            <div class="bd">
                <div class="ddl_field">
                    <asp:Label ID="lblTransferCompany" runat="server" Text="Company:"></asp:Label><asp:DropDownList
                        CssClass="dropdown_txt" ID="ddlTransferCompany" runat="server" DataSourceID="odsCompany"
                        DataTextField="co_name_short" DataValueField="co_id" AutoPostBack="true" OnSelectedIndexChanged="ddlTransferCompany_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="ddl_field">
                    <span>Department:</span><asp:DropDownList ID="ddlTransferDeparment" runat="server"
                        CssClass="dropdown_txt" DataSourceID="odsTransferDepartments" DataTextField="co_name_short"
                        DataValueField="dept_id">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="ft">
                <div style="float: left">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnTransfer" runat="server" Text="Transfer" OnClick="btnTransfer_Click"
                        CssClass="txt_white"></asp:LinkButton>
                </div>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
        
        <div class="ddl_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label>
            </div>
            <asp:DropDownList CssClass="dropdown_txt" ID="ddlCompany" runat="server" DataSourceID="odsCompany"
                DataTextField="co_name_short" DataValueField="co_id" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <div style="clear:both"></div>
        <div class="ddl_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Department:</span>
            </div>
            <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="odsDepartment"
                CssClass="dropdown_txt" DataTextField="co_name_short" DataValueField="dept_id"
                AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="ddl_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Document Type:</span>
            </div>
            <asp:DropDownList ID="ddlDocTypes" runat="server" DataSourceID="odsDocTypes" CssClass="dropdown_txt"
                DataTextField="doc_data_type_desc" DataValueField="doc_data_type_id" AutoPostBack="True"
                OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="ddl_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Category:</span>
            </div>
            <asp:DropDownList ID="ddlCategories" runat="server" DataSourceID="odsCategories"
                CssClass="dropdown_txt" DataTextField="category_name" DataValueField="category_id">
            </asp:DropDownList>
        </div>
        <div class="text_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Document Name:</span>
            </div>
            <asp:TextBox ID="tbName" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                ControlToValidate="tbName" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
        <div class="text_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Document Code:</span>
            </div>
            <asp:TextBox ID="tbCode" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                ControlToValidate="tbCode" ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
        <div class="text_field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Document Index:</span>
            </div>
            <ew:NumericBox ID="tbIndex" runat="server" CssClass="field_txt"></ew:NumericBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="tbIndex"
                ValidationGroup="Add"></asp:RequiredFieldValidator>
        </div>
        <div class="field" style="padding-bottom: 5px">
            <div style="float: left; width: 200px;">
                <span>Default:</span>
            </div>
            <asp:CheckBox ID="cbDefault" runat="server" />
        </div>
        <div class="field">
            <div style="float: left; width: 200px;">
                <asp:Label ID="lblContents" runat="server" Text="Contents:" Visible="false"></asp:Label>
            </div>
            <asp:FileUpload ID="fileUpload" runat="server" Visible="false" CssClass="field_txt" />
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_Click" ValidationGroup="Add"
                    CssClass="txt_white">Add Document</asp:LinkButton>
            </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            <a href="" onclick="canShowTransferDialog(this);" style="width: 250px; display: none">
                Transfer Selected Document</a>
        </div>
        <div class="grid">
            <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="table_header_result"
                Style="width: 100%;" DataKeyNames="doc_id" DataSourceID="odsDocs" PageSize="50"
                AllowPaging="True" AllowSorting="True" OnRowUpdating="gvDocs_RowUpdating" OnRowCommand="gvDocs_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Select" Visible="false">
                        <HeaderStyle Width="50px" />
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                            <asp:HiddenField ID="hfDocId" runat="server" Value='<%# Bind("doc_id") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <HeaderStyle Width="40px" />
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
                        <HeaderStyle Width="40px" />
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
                    <asp:TemplateField HeaderText="Category" SortExpression="category_name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="odsCategories" DataTextField="category_name"
                                CssClass="dropdown_txt" Style="width: 165px;" DataValueField="category_id" SelectedValue='<%# Bind("category_id") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code" SortExpression="doc_code">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbgDocCode" runat="server" Text='<%# Bind("doc_code") %>' Style="width: 40px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                CssClass="error" ControlToValidate="tbgDocCode" ValidationGroup="Grid"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("doc_code") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Document Name" SortExpression="doc_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbgDocName" runat="server" Text='<%# Bind("doc_name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                CssClass="error" ControlToValidate="tbgDocName" ValidationGroup="Grid"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("doc_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Document Index" SortExpression="doc_index">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbIndex" runat="server" Text='<%# Bind("doc_index") %>' Style="width: 105px;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator111" runat="server" ErrorMessage="*"
                                CssClass="error" ControlToValidate="tbIndex" ValidationGroup="Grid"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIndex" runat="server" Text='<%# Bind("doc_index") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default" SortExpression="flg_default">
                        <EditItemTemplate>
                            <center>
                                <asp:CheckBox ID="cbDefault" runat="server" Checked='<%# Bind("flg_default") %>' />
                            </center>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:CheckBox ID="cbDefault" runat="server" Checked='<%# Bind("flg_default") %>'
                                    Enabled="false" />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rel. Doc. Codes" SortExpression="related_doc_codes">
                        <ItemTemplate>
                            <img style="float: left;" alt="Edit" onclick="showEditDialog('<%#"RelatedDocumentList.aspx?" + WebConstants.Request.DEPT_ID + "=" + Eval("dept_id") + "&" + WebConstants.Request.DOC_ID + "=" + Eval("doc_id") + "&" + WebConstants.Request.DOC_TYPE_ID + "=" + Eval("doc_type_id") %>');"
                                src="../Images/Btn_edit.gif"></img>
                            <div style="float: left;">
                                <asp:TextBox ID="Label33" runat="server" Text='<%# Eval("related_doc_codes") %>'
                                    ReadOnly="true" Style="width: 60px;" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Detail" CommandArgument='<%#Eval("doc_id")%>'>Details</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header_search" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
            <asp:ObjectDataSource ID="odsDocs" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDocsByTypeId" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter"
                UpdateMethod="Update1" DeleteMethod="Delete1">
                <DeleteParameters>
                    <asp:Parameter Name="Original_doc_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="doc_name" Type="String" />
                    <asp:Parameter Name="doc_desc" Type="String" />
                    <asp:Parameter Name="doc_code" Type="String" />
                    <asp:Parameter Name="category_id" Type="Int32" />
                    <asp:Parameter Name="doc_index" Type="Int32" />
                    <asp:Parameter Name="original_doc_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="ddlDocTypes" DefaultValue="0" Name="doc_type_id"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCategories" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetCategoriesByType" TypeName="CategoriesTableAdapters.CategoryTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_category_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="Original_category_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:Parameter DefaultValue="D" Name="category_type" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="co_id" Type="Int32" />
                    <asp:Parameter Name="dept_id" Type="Int32" />
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="category_type" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_dept_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                    <asp:Parameter Name="dept_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="co_id" Type="Int32" />
                    <asp:Parameter Name="flg_deleted" Type="Boolean" />
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="created_by" Type="Int32" />
                    <asp:Parameter Name="date_created" Type="DateTime" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDocTypeByDeptId" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCompany" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAllCompanies" TypeName="CompanyTableAdapters.un_co_detailsTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_co_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="flg_deleted" Type="Boolean" />
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initials" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="licenses_purchased" Type="Int32" />
                    <asp:Parameter Name="lincenses_used" Type="Int32" />
                    <asp:Parameter Name="flg_system_locked" Type="Boolean" />
                    <asp:Parameter Name="last_ameneded_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                    <asp:Parameter Name="flg_autosave" Type="Boolean" />
                    <asp:Parameter Name="fire_warden_label" Type="String" />
                    <asp:Parameter Name="first_aider_label" Type="String" />
                    <asp:Parameter Name="flg_multi_supervisors" Type="Boolean" />
                    <asp:Parameter Name="supervisor_label" Type="String" />
                    <asp:Parameter Name="Original_co_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="flg_deleted" Type="Boolean" />
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initials" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="licenses_purchased" Type="Int32" />
                    <asp:Parameter Name="lincenses_used" Type="Int32" />
                    <asp:Parameter Name="flg_system_locked" Type="Boolean" />
                    <asp:Parameter Name="created_by" Type="Int32" />
                    <asp:Parameter Name="date_created" Type="DateTime" />
                    <asp:Parameter Name="last_ameneded_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                    <asp:Parameter Name="flg_autosave" Type="Boolean" />
                    <asp:Parameter Name="fire_warden_label" Type="String" />
                    <asp:Parameter Name="first_aider_label" Type="String" />
                    <asp:Parameter Name="flg_multi_supervisors" Type="Boolean" />
                    <asp:Parameter Name="supervisor_label" Type="String" />
                    <asp:Parameter Name="flg_active" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsTransferDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_dept_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                    <asp:Parameter Name="dept_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTransferCompany" DefaultValue="0" Name="co_id"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="co_id" Type="Int32" />
                    <asp:Parameter Name="flg_deleted" Type="Boolean" />
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="created_by" Type="Int32" />
                    <asp:Parameter Name="date_created" Type="DateTime" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
        <script type="text/javascript">
            // Instantiate the Dialog
            editDialog = new YAHOO.widget.Dialog("editDialog",
							{ width: "980px",
							    fixedcenter: true,
							    close: true,
							    zindex: 3,
							    modal: true,
							    visible: false,
							    constraintoviewport: false,
							    draggable: true
							});
            editDialog.render();
            transferDialog = new YAHOO.widget.Dialog("transferDialog",
							{ width: "680px",
							    fixedcenter: true,
							    close: true,
							    zindex: 3,
							    modal: true,
							    visible: false,
							    constraintoviewport: false,
							    draggable: true
							});
            transferDialog.render();

        </script>
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
