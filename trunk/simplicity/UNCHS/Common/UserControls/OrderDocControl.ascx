<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderDocControl.ascx.cs"
    Inherits="Common_UserControls_OrderDocControl" %>
<asp:HiddenField ID="hfDocTypeName" runat="server" />
<script type="text/javascript">
    var dialog;
</script>
<div id="dialog" style="display: none">
    <div class="hd">
        Select
        <%=DocTypeName%>
        to Add:</div>
    <div class="bd" style="overflow: auto; height: 400px">
        <div class="field">
            <asp:Repeater ID="rptDocs" runat="server" OnItemDataBound="rptDocs_ItemDataBound">
                <ItemTemplate>
                    <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>' />
                    <fieldset>
                        <legend><b>
                            <%# Container.DataItem %></b></legend>
                        <asp:CheckBoxList ID="cbDocs" runat="server" RepeatColumns="3" Width="100%">
                        </asp:CheckBoxList>
                    </fieldset>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="ft">
        <div style="float: left; padding-left:10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnAdd" runat="server" Text="Add (s)" OnClick="btnAdd_Click" CssClass="txt_white">Add (s)</asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="clear:both"></div>
        
    </div>
</div>
<div class="button_bar">
    <div class="button_right" style="padding-left: 340px;">
        <div style="float: left">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
        </div>
        <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
            <a href="#" class="txt_white" onclick="document.getElementById('dialog').style.display='block';dialog.show();">
                <%=DocTypeName%>List</a>
        </div>
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
    </div>
</div>
<div class="grid">
    <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="table_header_result"
        DataKeyNames="dept_order_doc_id" DataSourceID="odsDeptDocs" OnRowDeleted="gvDocs_RowDeleted"
        PageSize="50" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="Delete">
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                        </asp:ImageButton>
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="doc_name" HeaderText="Name" SortExpression="doc_name">
                <ItemStyle Width="75%" />
            </asp:BoundField>
            <asp:BoundField DataField="doc_code" HeaderText="Code" SortExpression="doc_code">
                <ItemStyle Width="20%" />
            </asp:BoundField>
        </Columns>
        <PagerStyle CssClass="grid_pager" />
        <FooterStyle CssClass="grid_footer" />
        <SelectedRowStyle CssClass="grid_selected_row" />
        <HeaderStyle CssClass="table_header" />
        <AlternatingRowStyle CssClass="grid_alternating_row" />
        <RowStyle CssClass="grid_row" />
    </asp:GridView>
</div>
<asp:ObjectDataSource ID="odsDeptDocs" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocsByTypeName"
    TypeName="DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter">
    <DeleteParameters>
        <asp:Parameter Name="Original_dept_order_doc_id" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
        <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="deptOrderId"
            Type="Int32" />
        <asp:ControlParameter ControlID="hfDocTypeName" DefaultValue="" Name="doc_type_name"
            PropertyName="Value" Type="String" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="order_id" Type="Int32" />
        <asp:Parameter Name="doc_id" Type="Int32" />
        <asp:Parameter Name="dept_id" Type="Int32" />
        <asp:Parameter Name="co_id" Type="Int32" />
        <asp:Parameter Name="flg_delete" Type="Boolean" />
    </InsertParameters>
</asp:ObjectDataSource>
<script type="text/javascript">
    // Instantiate the Dialog
    dialog = new YAHOO.widget.Dialog("dialog",
						{ width: "980px",
						    fixedcenter: true,
						    close: true,
						    zindex: 3,
						    modal: true,
						    visible: false,
						    constraintoviewport: false,
						    draggable: true
						});
    dialog.render();
</script>
