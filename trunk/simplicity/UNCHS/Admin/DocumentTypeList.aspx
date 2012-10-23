<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentTypeList.aspx.cs" Inherits="Maintenance_DocumentTypeList" Title="Simplicity4Business" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <!-- Dependency --> 
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/yahoo/yahoo-min.js")%>" ></script>

<!-- Event source file -->
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/event/event-min.js")%>"></script>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>"/>

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

    <style type="text/css">
        .text_field span{width:200px;height:100%;display:inline-block;}    
        .field span{width:200px;display:inline-block;}    
        .ddl_field span{width:200px;display:inline-block;}    
    </style>
    <script type="text/javascript">
        var transferDialog;

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
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Document Type List 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div id="transferDialog" style="display:none">
        <div class="hd">
            Select Company and Department to Transfer to:</div>
        <div class="bd">
            <div class="ddl_field"><span>Company:</span><asp:DropDownList ID="ddlTransferCompany" 
                runat="server" DataSourceID="odsCompany" DataTextField="co_name_short" 
                DataValueField="co_id" AutoPostBack="true" 
                    onselectedindexchanged="ddlTransferCompany_SelectedIndexChanged">
                </asp:DropDownList></div>

            <div class="ddl_field">
                <span>Department:</span><asp:DropDownList ID="ddlTransferDeparment" runat="server" 
                    DataSourceID="odsTransferDepartments" DataTextField="co_name_short" DataValueField="dept_id">                    
                </asp:DropDownList>                
            </div>
            <div class="field" style="text-align:center">
                <asp:CheckBox ID="cbTransferDocs" runat="server" Text="Transfer Documents and Templates" Visible="false"/>
            </div>
            
        </div>
        <div class="ft">
            <asp:Button ID="btnTransfer" runat="server" Text="Transfer" OnClick="btnTransfer_Click" />
        </div>
    </div>

    <div class="ddl_field"><span>Company:</span><asp:DropDownList ID="ddlCompany" 
        runat="server" DataSourceID="odsCompany" DataTextField="co_name_short" 
        DataValueField="co_id" AutoPostBack="true">
        </asp:DropDownList></div>

    <div class="ddl_field">
        <span>Department:</span><asp:DropDownList ID="ddlDepartment" runat="server" 
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
            AutoPostBack="True" Enabled="True">
        </asp:DropDownList>
    
    </div>
    <%-- <div class="text_field">
        <span>Document Type Desc:</span><asp:TextBox ID="tbDesc" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbDesc" ValidationGroup="Add"></asp:RequiredFieldValidator>    
    </div>
    <div class="text_field">
        <span>Sort Order:</span><ew:NumericBox ID="tbSortOrder" runat="server"></ew:NumericBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbSortOrder" ValidationGroup="Add"></asp:RequiredFieldValidator>    
    </div>
    <div class="field">
        <span>Required?:</span><asp:CheckBox ID="cbReqd" runat="server" />
    </div>    
    <div class="text_field">
        <span>Style:</span><asp:TextBox ID="tbStyle" runat="server"></asp:TextBox>
    </div>    
    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add Document Type" OnClick="btnAdd_Click" ValidationGroup="Add" />
    </div>
    --%>
    <div class="button_bar">
        <input type="button" value="Transfer Selected Document Types" onclick="canShowTransferDialog(this);" style="width:300px;"/>
    </div>
    
    <div class="grid">
                <asp:GridView ID="gvDocTypes" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="doc_data_type_id" DataSourceID="odsDocTypes" PageSize="50" AllowPaging="True" AllowSorting="True">
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
                    <Columns>
                <asp:TemplateField HeaderText="Select" >
                    <HeaderStyle Width="50px" />
                    <ItemTemplate>                                        
                        <asp:CheckBox ID="cbSelect" runat="server"/>
                        <asp:HiddenField ID="hfDocTypeId" runat="server" Value='<%# Bind("doc_data_type_id") %>'/>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>            
                    
                <asp:TemplateField HeaderText="Edit" >
                    <HeaderStyle Width="50px" />
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit" ></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update" ValidationGroup="Grid" ></asp:ImageButton>                    
                    </EditItemTemplate>              
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>            
                <asp:TemplateField HeaderText="Delete" >
                    <HeaderStyle Width="50px" />
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel" ></asp:ImageButton>                    
                    </EditItemTemplate>
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                    </ItemTemplate>         
                    <ItemStyle HorizontalAlign="Center" />     
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Document Type" SortExpression="doc_data_type_desc">
                        
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Index" SortExpression="sort_order">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sort_order") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sort_order") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Required?" SortExpression="required">
                            <EditItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("required") %>' />
                                </center>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("required") %>' Enabled="false" />
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style" SortExpression="style">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("style") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("style") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Checked?" SortExpression="flg_checked">
                            <EditItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("flg_checked") %>' />
                                </center>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("flg_checked") %>' Enabled="false" />
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
        </asp:GridView>    
    </div>
    <script type="text/javascript">
            // Instantiate the Dialog
            transferDialog = new YAHOO.widget.Dialog("transferDialog",
							{ width: "635px",
							    height: "28px",
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

    <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDocTypeByDeptId" 
        TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter" 
        DeleteMethod="Delete1" UpdateMethod="Update1">
        <DeleteParameters>
            <asp:Parameter Name="Original_doc_data_type_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="doc_data_type_desc" Type="String" />
            <asp:Parameter Name="sort_order" Type="Int32" />
            <asp:Parameter Name="required" Type="Boolean" />
            <asp:Parameter Name="style" Type="String" />
            <asp:Parameter Name="flg_checked" Type="Boolean" />
            <asp:Parameter Name="Original_doc_data_type_id" Type="Int32" />
            <asp:Parameter Name="doc_data_type_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCompany" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCompanies" 
        TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
    </asp:ObjectDataSource>    
    <asp:ObjectDataSource ID="odsTransferDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTransferCompany" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

