<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderSigHazard.aspx.cs" Inherits="Orders_AddOrderSigHazard" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css" )%>"/>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css" )%>"/>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Amend H&amp;S Folder
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server"><uc1:TabControl ID="TabControl1" runat="server" Selected="Sig Hazards" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        var hazardDialog;
    </script>

    
    <div style="text-align: right">
        <div class="button_bar">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
    <div id="hazardDialog">
        <div class="hd">
            Select Hazards to Add:</div>
        <div class="bd" style="overflow: auto;">
            <div class="field">
                <asp:CheckBoxList ID="cbHazards" runat="server" DataSourceID="odsHazard" DataTextField="name_desc"
                    DataValueField="sequence" RepeatColumns="2">
                </asp:CheckBoxList>
            </div>
        </div>
        <div class="ft">
            <asp:Button ID="btnAddHazards" runat="server" Text="Add Hazard(s)" OnClick="btnAddHazards_Click" />
        </div>
    </div>
    <div class="button_bar">
        <input type="button" value="Hazards List" onclick="hazardDialog.show();" />
    </div>
    <div class="field">
        <asp:TextBox ID="tbSigHazard" runat="server" Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbSigHazard"
            ErrorMessage="*" ValidationGroup="SigHazard"></asp:RequiredFieldValidator>
        <asp:Button ID="btnAddSigHazard" runat="server" Text="Add" Width="100px" OnClick="btnAddSigHazard_Click"
            ValidationGroup="SigHazard" />
    </div>
    <div class="grid">
        <asp:HiddenField ID="hfDeptId" runat="server" />
        <asp:GridView Width="75%" ID="gvSigHazard" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
            BorderWidth="1px" CellPadding="3" DataKeyNames="sequence" DataSourceID="odsSigHazard"
            ForeColor="Black" GridLines="Vertical" OnRowDeleting="gvSigHazard_RowDeleting"
            OnRowUpdating="gvSigHazard_RowUpdating" PageSize="50">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update"></asp:ImageButton>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel"></asp:ImageButton>
                    </EditItemTemplate>
                    <HeaderStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit"></asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                        </asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle />
                </asp:TemplateField>                
                <asp:BoundField DataField="hazard_desc" HeaderText="Hazard" SortExpression="hazard_desc" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        &nbsp;&nbsp;
        <asp:ObjectDataSource ID="odsHazard" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetRemainingSigHazards" TypeName="DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfDeptId" DefaultValue="0" Name="dept_id" PropertyName="Value"
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="dept_order_id" QueryStringField="deptOrderId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSigHazard" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSigHazards"
            TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="sequence" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="hazard_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="sequence" Type="Int32" />
                <asp:Parameter Name="original_sequence" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="hfDeptId" DefaultValue="0" Name="dept_id" PropertyName="Value"
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="order_seq" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>

    <script type="text/javascript">
        	// Instantiate the Dialog
		hazardDialog = new YAHOO.widget.Dialog("hazardDialog", 
							{ width : "700px",
							  height : "400px",
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false,
							  draggable:true
							});
		hazardDialog.render();

    </script>

</asp:Content>
